# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :student_manager,
  ecto_repos: [StudentManager.Repo]

# Configures the endpoint
config :student_manager, StudentManagerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vHgirkHt3kL5bYkFaELyBibeyj6BBXFvIkjqaq95JyV34/ddMrrXHErIryeBwsel",
  render_errors: [view: StudentManagerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: StudentManager.PubSub,
  live_view: [signing_salt: System.get_env("SIGNING_SALT") || "uqnwXrRe"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Use pow for user authentication
config :student_manager, :pow,
  user: StudentManager.Accounts.User,
  repo: StudentManager.Repo,
  web_module: StudentManagerWeb

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
