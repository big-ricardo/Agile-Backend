defmodule BackendWeb.OauthController do
  use BackendWeb, :controller

  action_fallback BackendWeb.FallbackController

  def sign_in(conn, params) do
    with  %Backend.Users{} = user <- Backend.sign_in(params) do
      {:ok, jwt, _claims} = Backend.Guardian.encode_and_sign(user)

      conn
      |> put_status(:created)
      |>  render("sign_in.json", user: user, jwt: jwt)
    end
  end

  def refresh(conn, _params) do
    with {:ok, %Backend.Users{} = user} <- Backend.refresh(Guardian.Plug.current_token(conn)) do
      conn
      |> put_status(:created)
      |>  render("refresh.json", user: user)
    end
  end

end
