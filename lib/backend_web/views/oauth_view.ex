defmodule BackendWeb.OauthView do
  use BackendWeb, :view

  def render("sign_in.json", %{user: user, jwt: jwt}) do
    %{
      error: :false,
      token: jwt,
      data: %{
        user:  render_one( user, BackendWeb.UsersView, "user.json")
      },
      message: "You are successfully logged in! Add this token to authorization header to make authorized requests."
    }
  end

  def render("refresh.json", %{user: user}) do
    %{
      error: :false,
      token: user.token,
      data: %{
        user: render_one(user, BackendWeb.UsersView, "user.json")
      },
      message: "You are successfully logged in! Add this token to authorization header to make authorized requests."
    }
  end

end
