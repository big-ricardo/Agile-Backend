defmodule Backend.Appointments.Index do
  alias Backend.{Repo, Appointments}

  def call() do
    Repo.all(Appointments)
    |> Repo.preload(:users)
    |> Repo.preload(services: :users)
  end

end
