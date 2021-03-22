defmodule BackendWeb.UsersController do
  use BackendWeb, :controller

  def create(conn, params)do
    params
    |> Backend.create_user()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %Backend.Users{} = user}, conn) do
    conn
    |> put_status(:create)
    |> render("create.json", user: user)
  end

end
