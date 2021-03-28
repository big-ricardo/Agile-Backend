defmodule BackendWeb.ServicesController do
  use BackendWeb, :controller

  def create(conn, params)do
    with {:ok, %Backend.Services{} = service} <- Backend.create_service(params) do
      conn
      |> put_status(:created)
      |> render("create.json", service: service)
    end
  end
end
