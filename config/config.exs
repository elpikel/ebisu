import Config

config :ebisu, Ebisu.Repo,
  database: "ebisu",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :ebisu, ecto_repos: [Ebisu.Repo]
