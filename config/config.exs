# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :backend,
  ecto_repos: [Backend.Repo]

# UUID como padrão para Ids
config :backend, Backend.Repo ,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id],
  types: Backend.PostgresTypes,
  extensions: [{Geo.PostGIS.Extension, library: Geo}]

# Configures the endpoint
config :backend, BackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "w3PPLfNMhgSZEgCE1SRw5I2h+u/svz9Wmcw8Gpcx3Ns42fc69KAoZiWeBcGsgR85",
  render_errors: [view: BackendWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Backend.PubSub,
  live_view: [signing_salt: "drUmKDPX"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

#Config Guardian
config :backend, Backend.Guardian,
       issuer: "Agile",
       ttl: { 1, :weeks },
       secret_key: "aagYthM2IQKz+B/ZuBT6BkYVhrX1Jtiyf2a8Ro/ThSI2wJ8htXW5/o6V4/veHn3g"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
