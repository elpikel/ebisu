defmodule Ebisu.BittrexTest do
  use Ebisu.DataCase

  alias Ebisu.Bittrex
  alias Ebisu.Bittrex.Ticker

  alias Ebisu.Repo

  test "adds ticker" do
    {:ok, added_ticker} = Bittrex.add_ticker()

    assert added_ticker = Repo.get(Ticker, added_ticker.id)
  end
end
