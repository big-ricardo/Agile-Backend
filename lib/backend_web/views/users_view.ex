defmodule BackendWeb.UsersView do
  use BackendWeb, :view

  def render("create.json", %{user: %Backend.Users{} = user}) do
    %{
      message: "success",
      error: false,
      user:  render_many(user, BackendWeb.UsersView, "user.json")
    }
  end

  def render("index.json", %{users: users}) do
    %{
      message: "success",
      error: false,
      data: render_many(users, BackendWeb.UsersView, "user.json")
    }
  end

  def render("user.json", %{users: users})do
    %{
      id: users.id,
      name: users.name,
      email: users.email,
      nickname: users.nickname,
      services: render_many( users.services, BackendWeb.UsersView ,"service.json")
    }
  end

  def render("service.json", %{users: service})do
    %{
      id: service.id,
      name: service.name,
      price: service.price,
      duration: service.duration
    }
  end

end
