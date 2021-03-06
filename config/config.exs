# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ebisu,
  ecto_repos: [Ebisu.Repo]

config :ebisu, :http_client, Ebisu.Utils.Http

# Configures the endpoint
config :ebisu, EbisuWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "APvmjaw5EwzB/5soZSYHrwnjFIvxQvxh+rAZxw5EusNyEX9PWAPgm5WrA7dWbKh8",
  render_errors: [view: EbisuWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Ebisu.PubSub,
  live_view: [signing_salt: "GqBVG1QP"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ebisu, :exchange_worker_interval, 6_000

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
