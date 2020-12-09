defmodule Ebisu.Bitbay.Worker.TickerTest do
  alias Ebisu.Bitbay.Worker.Ticker, as: TickerWorker
  alias Ebisu.Bitbay.Ticker

  setup do
    ticker_worker = TickerWorker.start_link(interval: 100)

    %{ticker_worker: ticker_worker}
  end

  test "inserts message", %{ticker_worker: ticker_worker} do
    Process.sleep(1000)
  end
end
