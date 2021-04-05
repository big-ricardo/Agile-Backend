defmodule BackendWeb.ServicesController do
  use BackendWeb, :controller

  action_fallback BackendWeb.FallbackController

  def create(conn, params)do
    with {:ok, %Backend.Services{} = service} <- Backend.create_service(params) do
      conn
      |> put_status(:created)
      |> render("create.json", service: service)
    end
  end

  def index(conn, _params)do
    with [%Backend.Services{} | _rest] = services <- Backend.select_services() do
      conn
      |> put_status(:ok)
      |> render("index.json", services: services)
    end
  end

end
