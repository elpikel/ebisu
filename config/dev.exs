use Mix.Config

config :ebisu, Ebisu.Repo,
  username: "postgres",
  password: "postgres",
  database: "ebisu",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
