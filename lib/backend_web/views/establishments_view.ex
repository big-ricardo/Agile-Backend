defmodule BackendWeb.EstablishmentsView do
  use BackendWeb, :view

  def render("create.json", %{establishment: establishment}) do
    %{
      message: "success",
      error: false,
     data: render_one(establishment, BackendWeb.EstablishmentsView , "establishments.json")
    }
  end

  def render("index.json", %{establishments: establishments}) do
    %{
      message: "success",
      error: false,
      data: render_many( establishments, BackendWeb.EstablishmentsView, "establishments.json")
    }
  end

  def render("establishments.json", %{establishments: establishment})do
    %{
      id: establishment.id,
      zip_code: establishment.zip_code,
      state: establishment.state,
      city: establishment.city
    }
  end

  def render("establishment.json", %{establishments: establishment})do
    %{
      id: establishment.id,
      zip_code: establishment.zip_code,
      point: [establishment.lat, establishment.lgn],
      state: establishment.state,
      city: establishment.city
    }
  end

end
