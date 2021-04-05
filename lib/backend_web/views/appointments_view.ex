defmodule BackendWeb.AppointmentsView do
  use BackendWeb, :view

  def render("create.json", %{appointment: appointment}) do
    %{
      message: "success",
      error: false,
     appointment: render_one(appointment, BackendWeb.AppointmentsView, "appointments.json")
    }
  end

  def render("index.json", %{appointments: appointments}) do
    IO.inspect(appointments)
    %{
      message: "success",
      error: false,
      data: render_many( appointments, BackendWeb.AppointmentsView, "appointment.json")
    }
  end

  def render("appointment.json", %{appointments: appointment})do
    %{
      id: appointment.id,
      name: appointment.date_time,
      user: render_one( appointment.users, BackendWeb.UsersView, "users.json"),
      service: render_one( appointment.services, BackendWeb.ServicesView, "service.json")
    }
  end

  def render("appointments.json", %{appointments: appointment})do
    %{
      id: appointment.id,
      date_time: appointment.date_time,
      service: render_one( appointment.services, BackendWeb.ServicesView, "service.json")
    }
  end

end
