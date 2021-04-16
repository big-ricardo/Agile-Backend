defmodule Backend.Oauth.Sign_in do

  alias Backend.{Repo, Users}

  def call(params)do
    params
    |> Users.changeset_sign_in()
    |> find_and_confirm_password()
    |> IO.inspect()
  end

  defp find_and_confirm_password(%Ecto.Changeset{valid?: true, changes: %{email: email, password: password}}) do
    case Repo.get_by(Users, email: email) do
      nil ->
        {:error, :not_found}
      user ->
        if password == user.password_hash do
          user.id
          |> Backend.select_user()
        else
          {:error, :unauthorized}
        end
    end
  end

  defp find_and_confirm_password(%Ecto.Changeset{valid?: false} = changeset) do
    {:error, changeset}
  end

end
