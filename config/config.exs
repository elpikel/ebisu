import Config

config :ebisu, ecto_repos: [Ebisu.Repo]

import_config "#{Mix.env()}.exs"
