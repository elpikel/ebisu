defmodule Ebisu.Bittrex do
  alias Ebisu.Bittrex.Clients.Http
  alias Ebisu.Bittrex.Ticker

  alias Ebisu.Repo

  import Ecto.Query

  def add_ticker do
    ticker = Http.get_ticker()
    summary = Http.get_summary()

    ticker
    |> combine(summary)
    |> Ticker.changeset()
    |> Repo.insert()
  end

  def tickers() do
    Ticker
    |> order_by(desc: :updated_at)
    |> limit(20)
    |> Repo.all()
  end

  defp combine(ticker, summary) do
    %{
      high: summary["high"],
      low: summary["low"],
      volume: summary["volume"],
      quoteVolume: summary["quoteVolume"],
      last: ticker["lastTradeRate"],
      bid: ticker["bidRate"],
      ask: ticker["askRate"]
    }
  end
end
