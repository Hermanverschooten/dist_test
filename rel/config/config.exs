use Mix.Config

config :dist_test, DistTestWeb.Endpoint,
  url: [scheme: "https", host: "studentenjobs.be", port: 443],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :debug

database_url =
  System.get_env("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

config :dist_test, DistTest.Repo,
  # ssl: true,
  url: database_url,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :dist_test, DistTestWeb.Endpoint,
  http: [:inet6, port: String.to_integer(System.get_env("PORT") || "4000")],
  secret_key_base: secret_key_base,
  server: true,
  root: ".",
  version: Application.spec(:dist_test, :vsn),
  check_origin: [
    "//localhost"
  ]

