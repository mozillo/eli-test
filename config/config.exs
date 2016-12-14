# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hello_phoenix,
  ecto_repos: [HelloPhoenix.Repo]

# Configures the endpoint
config :hello_phoenix, HelloPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "A9X4glWrzJrMj+jz9FvpJnH59b27ZwjHtb4WaO0RlX6YYLkqTozbimFclsPwNhkQ",
  render_errors: [view: HelloPhoenix.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HelloPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :addict,
  secret_key: "24326224313224753247574455764c573961496f3065574d55304f482e",
  extra_validation: fn ({valid, errors}, user_params) -> {valid, errors} end, # define extra validation here
  user_schema: HelloPhoenix.User,
  repo: HelloPhoenix.Repo
  # from_email: "postmaster@hello_phoenix.com", # CHANGE THIS
  # mailgun_domain: "sandbox4f7892e47b48459d8df8b5afd49adfa8.mailgun.org",
  # mailgun_key: "39012df49e454c04e74c6915a57c6ff6",
  # mail_service: :smtp
