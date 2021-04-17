defmodule BackendWeb.ServicesController do
  use BackendWeb, :controller

  action_fallback BackendWeb.FallbackController

  def create(conn, params)do
    with {:ok, %Backend.Services{} = service} <- Backend.create_service(Map.merge(params, %{"users_id"=> Backend.Users.getId(conn)})) do
      conn
      |> put_status(:created)
      |> render("create.json", service: service)
    end
  end

  def index(conn, params)do
    with %Scrivener.Page{} = page <- Backend.select_services(params) do
      conn
      |> put_status(:ok)
      |> render("index.json", page: page )
    end
  end

end
