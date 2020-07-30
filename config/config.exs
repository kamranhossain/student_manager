# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pow_auth_guild,
  ecto_repos: [PowAuthGuild.Repo]

# Configures the endpoint
config :pow_auth_guild, PowAuthGuildWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vHgirkHt3kL5bYkFaELyBibeyj6BBXFvIkjqaq95JyV34/ddMrrXHErIryeBwsel",
  render_errors: [view: PowAuthGuildWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PowAuthGuild.PubSub,
  live_view: [signing_salt: System.get_env("SIGNING_SALT") || "uqnwXrRe"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Use pow for user authentication
config :pow_auth_guild, :pow,
  user: PowAuthGuild.Users.User,
  repo: PowAuthGuild.Repo

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
