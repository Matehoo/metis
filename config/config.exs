import Config

version = Mix.Project.config()[:version]

config :metis,
  ecto_repos: [Metis.Repo],
  version: version

config :phoenix, :json_library, Jason

config :metis, MetisWeb.Endpoint,
  pubsub_server: Metis.PubSub,
  render_errors: [view: MetisWeb.Errors.View, accepts: ~w(html json)]

config :metis, Metis.Repo, start_apps_before_migration: [:ssl]

config :metis, Corsica, allow_headers: :all

config :metis, Metis.Gettext, default_locale: "en"

config :metis, MetisWeb.ContentSecurityPolicy, allow_unsafe_scripts: false

config :esbuild,
  version: "0.13.13",
  default: [
    args: ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :sentry,
  root_source_code_path: File.cwd!(),
  release: version

config :logger, backends: [:console, Sentry.LoggerBackend]

# Import environment configuration
import_config "#{Mix.env()}.exs"
