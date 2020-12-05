defmodule Ebisu.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Ebisu.Repo
    ]

    opts = [strategy: :one_for_one, name: Ebisu.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
