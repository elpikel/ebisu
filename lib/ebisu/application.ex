defmodule Ebisu.Application do
  @moduledoc false

  use Application

  alias Ebisu.Bitbay.Worker.Ticker, as: BitbayTicker

  def start(_type, _args) do
    children = [
      Ebisu.Repo,
      BitbayTicker
    ]

    opts = [strategy: :one_for_one, name: Ebisu.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
