defmodule Ebisu.Bitbay.Worker.TickerTest do
  use Ebisu.DataCase

  alias Ebisu.Bitbay.Worker.Ticker, as: TickerWorker
  alias Ebisu.Bitbay.Ticker

  setup do
    ticker_worker = TickerWorker.start_link(interval: 100)

    %{ticker_worker: ticker_worker}
  end

  test "inserts message" do
    Process.sleep(1000)

    assert Repo.aggregate(Ticker, :count) > 0
  end
end
