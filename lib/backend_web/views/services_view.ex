defmodule BackendWeb.ServicesView do
  use BackendWeb, :view

  def render("create.json", %{service: service}) do
    %{
      error: false,
      data: render_one(service, BackendWeb.ServicesView, "services.json")
    }
  end

  def render("index.json", %{page: page}) do
    %{
      error: false,
      data: render_many(page.entries, BackendWeb.ServicesView, "service.json"),
      page_number: page.page_number,
      page_size: page.page_size,
      total_pages: page.total_pages,
      total_entries: page.total_entries
    }
  end

  def render("services.json", %{services: service}) do
    %{
      id: service.id,
      name: service.name,
      price: service.price,
      duration: service.duration
    }
  end

  def render("service.json", %{services: service}) do
    %{
      id: service.id,
      name: service.name,
      price: service.price,
      duration: service.duration,
      user: render_one(service.users, BackendWeb.UsersView, "users.json")
    }
  end
end
