defmodule BackendWeb.ServicesView do

  def render("create.json", %{service: %Backend.Services{ id: id, name: name, users_id: user, duration: duration, price: price }}) do
    %{
      message: "success",
      error: false,
     service: %{
        id: id,
        user: user,
        name: name,
        duration: duration,
        price: price ,
     }
    }
  end

end
