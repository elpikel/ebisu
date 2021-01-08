defmodule Ebisu.Cex.Clients.HttpTest do
  use ExUnit.Case, async: true

  alias Ebisu.Cex.Clients.Http

  test "fetches ticker" do
    ticker = Http.get_ticker()

    assert ticker["high"] != nil
    assert ticker["low"] != nil
    assert ticker["volume"] != nil
    assert ticker["last"] != nil
    assert ticker["bid"] != nil
    assert ticker["ask"] != nil
  end
end
