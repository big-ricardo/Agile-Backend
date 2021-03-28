defmodule Backend.Services.Create do
  alias Backend.{Repo, Services}

  def call(params) do
    params
    |> Services.changeset()
    |> Repo.insert()
  end

end
