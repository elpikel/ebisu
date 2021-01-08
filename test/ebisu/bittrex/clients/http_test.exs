defmodule Ebisu.Bittrex.Clients.HttpTest do
  use ExUnit.Case, async: true

  alias Ebisu.Bittrex.Clients.Http

  test "fetches ticker" do
    ticker = Http.get_ticker()

    assert ticker["askRate"] != nil
    assert ticker["bidRate"] != nil
    assert ticker["lastTradeRate"] != nil
  end

  test "fetches summary" do
    ticker = Http.get_summary()

    assert ticker["high"] != nil
    assert ticker["low"] != nil
    assert ticker["quoteVolume"] != nil
    assert ticker["volume"] != nil
  end
end
