defmodule BackendWeb.SessionView do
  use BackendWeb, :view

  def render("sign_in.json", %{user: user, jwt: jwt}) do
    %{
      error: :false,
      data: %{
        token: jwt,
        email: user.email
      },
      message: "You are successfully logged in! Add this token to authorization header to make authorized requests."
    }
  end

  def render("sign_up.json", %{jwt: jwt}) do
    %{
      error: :false,
      data: %{
        token: jwt,
      },
      message: "You are successfully logged in! Add this token to authorization header to make authorized requests."
    }
  end

end
