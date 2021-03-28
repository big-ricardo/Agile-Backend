defmodule Backend.Appointments.Create do
  alias Backend.{ Repo, Appointments}

  def call(params) do
    params
    |> Appointments.changeset()
    |> Repo.insert()
  end

end
