defmodule Backend.Users.Show do
  alias Backend.{Repo, Users}

  def call(id) do
    IO.inspect(id)
    Repo.get(Users, id)
    |> Repo.preload([:services, appointments: [services: :users]])
  end

end
