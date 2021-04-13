defmodule Backend.Establishments.Create do
  alias Backend.{Repo, Establishments}

  def call(params) do
    params
    |> Establishments.changeset()
    |> Repo.insert()
  end
end
