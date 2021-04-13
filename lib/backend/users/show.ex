defmodule Backend.Users.Show do
  alias Backend.{Repo, Users}

  def call(id) do
    Repo.get(Users, id)
    |> Repo.preload([:services, appointments: [services: :users]])
  end

  def inspect(id) do
    Repo.get(Users, id)
  end

end
