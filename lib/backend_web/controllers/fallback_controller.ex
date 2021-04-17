defmodule BackendWeb.FallbackController do
  use BackendWeb, :controller


  def call(conn, {:error, %Ecto.Changeset{} = result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(BackendWeb.ErrorView)
    |> render("400.json", result: result)
  end

  def call(conn, nil)do
    conn
    |> put_status(:bad_request)
    |> put_view(BackendWeb.ErrorView)
    |> render("400.json", result: "not resource")
  end

end
