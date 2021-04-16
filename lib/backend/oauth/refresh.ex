defmodule Backend.Oauth.Refresh do

  def call(token)do
    token
    |> Backend.Guardian.refresh()
    |> refreshing()
  end

  defp refreshing({:ok, _old_stuff, {jwt, _new_claims}})do
    {:ok, %{"sub"=> id}} = Backend.Guardian.decode_and_verify(jwt)

    %Backend.Users{} = user = Backend.select_user(id)

    {:ok, Map.merge(user, %{:token=> jwt})}

  end

  defp refreshing({:error, _error } = error)do
    error
  end

end
