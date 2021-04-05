defmodule BackendWeb.UsersView do
  use BackendWeb, :view

  def render("create.json", %{user: user}) do
    IO.inspect(user)
    %{
      message: "success",
      error: false,
      user:  render_one(user, BackendWeb.UsersView, "users.json")
    }
  end

  def render("index.json", %{users: users}) do
    %{
      message: "success",
      error: false,
      data: render_many(users, BackendWeb.UsersView, "users.json")
    }
  end

  def render("show.json", %{user: user}) do
    %{
      message: "success",
      error: false,
      data: render_one(user, BackendWeb.UsersView, "user.json")
    }
  end

  def render("user.json", %{users: user})do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      avatar: user.avatar,
      nickname: user.nickname,
      services: render_many( user.services, BackendWeb.ServicesView ,"services.json"),
      appointments: render_many( user.appointments, BackendWeb.AppointmentsView ,"appointments.json")
    }
  end

  def render("users.json", %{users: user})do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      nickname: user.nickname,
      avatar: user.avatar
    }
  end

end
