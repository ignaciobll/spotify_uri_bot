# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :ex_gram,
  token: {:system, "BOT_TOKEN"}

config :spotify_uri_bot,
  client_token: {:system, "CLIENT_TOKEN"},
  admins: []

config :spotify_uri_bot, SpotifyUriBot.Scheduler,
  jobs: [
    # Runs every midnight:
    {"@daily", {SpotifyUriBot.Cron, :check_stats, []}}
  ]

config :logger,
  level: :debug,
  backends: [{LoggerFileBackend, :debug}, {LoggerFileBackend, :error}]

config :logger, :debug,
  path: "log/debug.log",
  level: :debug,
  format: "$dateT$timeZ [$level] $message\n"

config :logger, :error,
  path: "log/error.log",
  level: :error,
  format: "$dateT$timeZ [$level] $message\n"
