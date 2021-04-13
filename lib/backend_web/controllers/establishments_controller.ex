defmodule BackendWeb.EstablishmentsController do
  use BackendWeb, :controller

  action_fallback BackendWeb.FallbackController

  def create(conn, params)do
    with {:ok, %Backend.Establishments{} = establishment} <- Backend.create_establishment(params) do
      conn
      |> put_status(:created)
      |> render("create.json", establishment: establishment)
    end
  end

  def index(conn, params) do
    with {:ok, establishments} <- Backend.select_establishments(params) do
      conn
      |> put_status(:ok)
      |> render("index.json", establishments: establishments)
    end
  end
end
