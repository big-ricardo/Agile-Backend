defmodule BackendWeb.AppointmentsController do
  use BackendWeb, :controller

  action_fallback BackendWeb.FallbackController

  def create(conn, params)do
    with {:ok, %Backend.Appointments{} = appointment} <- Backend.create_appointment(params) do
      conn
      |> put_status(:created)
      |> render("create.json", appointment: appointment)
    end
  end

  def index(conn, _params) do
    with [%Backend.Appointments{} | _rest] = appointments <- Backend.select_appointments() do
      conn
      |> put_status(:ok)
      |> render("index.json", appointments: appointments)
    end
  end

  def time(conn, _params)do
    start = Timex.to_datetime({{2015, 6, 24}, {7, 00, 00}}, "UTC")
    finish = Timex.to_datetime({{2015, 6, 24}, {12, 00, 00}}, "UTC")

    periodoTrabalho = Timex.Interval.new(from: start, until: finish,  right_open: true)
    reserveDateTime = Timex.to_datetime({{2015, 6, 24}, {11, 30 , 00}}, "UTC")
    reserve = Timex.Interval.new(from: reserveDateTime,  until: [minutes: 30])
    reserveds = [%{time: {{2015, 6, 24}, {7, 30, 00}}, duration: 30}, %{time: {{2015, 6, 24}, {9, 30, 00}}, duration: 30}]

    result = if Elixir.Timex.Interval.contains?(periodoTrabalho, reserve) do
      testSchedule(reserve, reserveds)
    else
      false
    end

    text conn, "#{result}"
  end

  defp testSchedule( reserve, reserveds) do
    results = Enum.map(reserveds, fn reserved ->  Timex.Interval.overlaps?(reserve, Timex.Interval.new(from: Timex.to_datetime(reserved[:time], "UTC"), until: [minutes: reserved[:duration]])) end)
    !Enum.member?(results, true)
  end
end
