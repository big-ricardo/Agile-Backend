defmodule BackendWeb.UsersView do

  def render("create.json", %{user: %Backend.Users{ id: id, name: name, nickname: nickname }}) do
    %{
      message: "User Create",
      user: %{
        id: id,
        name: name,
        nickname: nickname
      }
    }
  end

end
