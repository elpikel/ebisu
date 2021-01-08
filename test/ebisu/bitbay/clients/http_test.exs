defmodule Ebisu.Bitbay.Clients.HttpTest do
  use ExUnit.Case, async: true

  alias Ebisu.Bitbay.Clients.Http

  test "fetches ticker" do
    ticker = Http.get_ticker()

    assert ticker["max"] != nil
    assert ticker["min"] != nil
    assert ticker["last"] != nil
    assert ticker["bid"] != nil
    assert ticker["ask"] != nil
    assert ticker["vwap"] != nil
    assert ticker["average"] != nil
    assert ticker["volume"] != nil
  end
end
