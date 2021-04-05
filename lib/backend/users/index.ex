defmodule Backend.Users.Index do
  alias Backend.{Repo, Users}

  def call() do
    Repo.all(Users)
  end

end
