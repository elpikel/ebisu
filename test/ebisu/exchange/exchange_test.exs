defmodule Ebisu.ExchangeTest do
  use Ebisu.DataCase, async: true

  alias Ebisu.Exchange
  alias Ebisu.Exchange.Ticker

  alias Ebisu.Repo

  test "adds ticker" do
    {:ok, added_ticker} = Exchange.add_ticker()

    assert added_ticker = Repo.get(Ticker, added_ticker.id)
  end
end
