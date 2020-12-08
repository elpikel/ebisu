use Mix.Config

config :ebisu, Ebisu.Repo,
  username: "postgres",
  password: "postgres",
  database: "ebisu_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
