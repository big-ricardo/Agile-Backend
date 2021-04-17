defmodule Backend.Repo do
  use Ecto.Repo,
    otp_app: :backend,
    adapter: Ecto.Adapters.Postgres

  use Scrivener, page_size: 10
end
