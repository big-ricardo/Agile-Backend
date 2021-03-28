defmodule Backend.Services.Index do
  alias Backend.{Repo, Services}

  def call() do
    Repo.all(Services)
    |> Repo.preload(:users)
  end

end
