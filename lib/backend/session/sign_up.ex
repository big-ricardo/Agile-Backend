defmodule Backend.Users.Sign_up do

  def call(token)do
    IO.inspect(Backend.Guardian.decode_and_verify(token))

    token
    |> Backend.Guardian.refresh()

  end



end
