defmodule BackendWeb.AppointmentsView do

  def render("create.json", %{user: %Backend.Users{ id: id, name: name, nickname: nickname }}) do
    %{
      message: "success",
      error: false,
      user: %{
        id: id,
        name: name,
        nickname: nickname
      }
    }
  end

end
