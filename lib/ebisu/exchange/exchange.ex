defmodule Ebisu.Exchange do
  alias Ebisu.Exchange.Clients.Http
  alias Ebisu.Exchange.Ticker

  alias Ebisu.Repo

  import Ecto.Query

  def add_ticker do
    Http.get_ticker()
    |> Ticker.changeset()
    |> Repo.insert()
  end

  def tickers(limit \\ 20) do
    Ticker
    |> order_by(desc: :updated_at)
    |> limit(^limit)
    |> Repo.all()
  end
end
