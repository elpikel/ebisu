defmodule Ebisu.BitbayTest do
  use Ebisu.DataCase, async: true

  alias Ebisu.Bitbay
  alias Ebisu.Bitbay.Ticker

  alias Ebisu.Repo

  test "adds ticker" do
    {:ok, added_ticker} = Bitbay.add_ticker()

    assert added_ticker = Repo.get(Ticker, added_ticker.id)
  end
end
