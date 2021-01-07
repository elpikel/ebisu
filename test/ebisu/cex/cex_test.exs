defmodule Ebisu.CexTest do
  use Ebisu.DataCase

  alias Ebisu.Cex
  alias Ebisu.Cex.Ticker

  alias Ebisu.Repo

  test "adds ticker" do
    {:ok, added_ticker} = Cex.add_ticker()

    assert added_ticker = Repo.get(Ticker, added_ticker.id)
  end
end
