defmodule BackendWeb.ServicesView do
  use BackendWeb, :view

  def render("create.json", %{service: service}) do
    %{
      message: "success",
      error: false,
     data: render_one(service, BackendWeb.ServicesView, "services.json")
    }
  end

  def render("index.json", %{services: services}) do
    %{
      message: "success",
      error: false,
     data: render_many( services, BackendWeb.ServicesView, "service.json")
    }
  end

  def render("services.json", %{services: service})do
    %{
      id: service.id,
      name: service.name,
      price: service.price,
      duration: service.duration,
    }
  end

  def render("service.json", %{services: service})do
    %{
      id: service.id,
      name: service.name,
      price: service.price,
      duration: service.duration,
      user: render_one( service.users, BackendWeb.UsersView, "users.json")
    }
  end

end
