defmodule Backend.Users.Create do
  alias Backend.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end

end
