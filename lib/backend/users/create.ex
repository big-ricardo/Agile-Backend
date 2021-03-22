defmodule Backend.Users.Create do
  alias Backend.{Repo, Users}

  def call(params) do
    params
    |> Users.changeset()
    |> Repo.insert()
  end

end
