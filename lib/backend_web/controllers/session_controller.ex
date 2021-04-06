defmodule BackendWeb.SessionController do
  use BackendWeb, :controller

  action_fallback BackendWeb.FallbackController

  def sign_in(conn, params) do
    with {:ok, %Backend.Users{} = user} <- Backend.sign_in(params) do
      {:ok, jwt, _claims} = Backend.Guardian.encode_and_sign(user)

      conn
      |> put_status(:created)
      |>  render("sign_in.json", user: user, jwt: jwt)
    end
  end

  def sign_up(conn, _params) do
    with {:ok, _old_stuff, {jwt, _new_claims}} <- Backend.sign_up(Enum.at(Plug.Conn.get_req_header(conn, "token"), 0)) do

      conn
      |> put_status(:created)
      |>  render("sign_up.json", jwt: jwt)
    end
  end

end
