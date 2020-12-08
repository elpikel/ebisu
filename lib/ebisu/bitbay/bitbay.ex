defmodule Ebisu.Bitbay do
  alias Ebisu.Bitbay.Clients.Http
  alias Ebisu.Bitbay.Ticker

  alias Ebisu.Repo

  def add_ticker do
    Http.get_ticker()
    |> Ticker.changeset()
    |> Repo.insert()
  end
end
