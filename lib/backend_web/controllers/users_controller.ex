defmodule BackendWeb.UsersController do
  use BackendWeb, :controller

  action_fallback BackendWeb.FallbackController

  def create(conn, params)do
    with {:ok, %Backend.Users{} = user} <- Backend.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  def index(conn, _params) do
    with [%Backend.Users{} | _rest] = users <- Backend.select_users() do
      conn
      |> put_status(:ok)
      |> render("index.json", users: users)
    end
  end

  def show(conn, _params)do
    {:ok, claims} = Backend.Guardian.decode_and_verify(Guardian.Plug.current_token(conn))

    with {:ok, %Backend.Users{} = user} <- Backend.Guardian.resource_from_claims(claims) do
      conn
      |> put_status(:ok)
      |> render("show.json", user: user)
    end
  end

end
