# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hydra,
  ecto_repos: [Hydra.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :hydra, HydraWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "r6yDkdZ0Z6InE5XlPpLHckRD9sP+HWfsRwQszjTmAsqtpljl36m1NyKfQLdFYyXc",
  render_errors: [view: HydraWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Hydra.PubSub,
  live_view: [signing_salt: "kv8PfoDj"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]
config :hydra , :mongo_config,
  name: :mongo,
  url: "mongodb+srv://abobora123:abobora123@cluster0.ton48.azure.mongodb.net/pickings",
  poll_size: 2
# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
import_config "kafka.picking.consumer.config.exs"
import_config "poolboy.mongo.config.exs"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
