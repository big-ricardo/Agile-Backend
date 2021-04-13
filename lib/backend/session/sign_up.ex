defmodule Backend.Users.Sign_up do

  def call(token)do
    token
    |> Backend.Guardian.refresh()
  end



end
