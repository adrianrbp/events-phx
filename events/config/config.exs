# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

# Configure Mix tasks and generators
config :events,
  ecto_repos: [Events.Repo]

config :events_web,
  ecto_repos: [Events.Repo],
  generators: [context_app: :events]

# Configures the endpoint
config :events_web, EventsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Z6Rtq9H4wsjGbuV1ACZ6uZxMSCFOsAgY18o/ZeK9hOSx7X5vRPgBDC0N2uKvYc7W",
  render_errors: [view: EventsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Events.PubSub,
  live_view: [signing_salt: "FxOpce5X"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
