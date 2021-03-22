defmodule Backend do
  alias Backend.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
