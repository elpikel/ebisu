defmodule Ebisu.Bittrex do
  alias Ebisu.Bittrex.Clients.Http
  alias Ebisu.Bittrex.Ticker

  alias Ebisu.Repo

  import Ecto.Query

  def add_ticker do
    ticker = Http.get_ticker() |> IO.inspect()
    summary = Http.get_summary() |> IO.inspect()

    %{
      high: summary["high"],
      low: summary["low"],
      volume: summary["volume"],
      quoteVolume: summary["quoteVolume"],
      last: ticker["lastTradeRate"],
      bid: ticker["bidRate"],
      ask: ticker["askRate"]
    }
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
