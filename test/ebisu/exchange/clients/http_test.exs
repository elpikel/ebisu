defmodule Ebisu.Exchange.Clients.HttpTest do
  use ExUnit.Case, async: true

  alias Ebisu.Exchange.Clients.Http

  test "fetches ticker" do
    ticker = Http.get_ticker()

    assert ticker["high"] != nil
    assert ticker["low"] != nil
    assert ticker["volume"] != nil
    assert ticker["volumeQuote"] != nil
    assert ticker["last"] != nil
    assert ticker["bid"] != nil
    assert ticker["ask"] != nil
    assert ticker["open"] != nil
  end
end
