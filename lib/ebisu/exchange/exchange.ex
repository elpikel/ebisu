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

  def tickers() do
    Ticker
    |> order_by(desc: :updated_at)
    |> limit(20)
    |> Repo.all()
  end
end
