import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :ebisu, Ebisu.Repo,
  username: "postgres",
  password: "postgres",
  database: "ebisu_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ebisu, EbisuWeb.Endpoint,
  http: [port: 4002],
  secret_key_base: "8irm1qRx+eXRhBOeJFy6L0xB71Pfr9RIqmmpRhad4r7Yy4Bb8qgnEMTFtC4VbR28",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
