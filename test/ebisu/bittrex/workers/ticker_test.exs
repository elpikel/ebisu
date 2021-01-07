defmodule Ebisu.Bittrex.Worker.TickerTest do
  use Ebisu.DataCase

  alias Ebisu.Bittrex.Worker.Ticker, as: TickerWorker
  alias Ebisu.Bittrex.Ticker

  setup do
    start_supervised(%{
      id: TickerWorker,
      start: {TickerWorker, :start_link, [[interval: 100]]}
    })

    :ok
  end

  test "inserts message" do
    Process.sleep(1000)

    assert Repo.aggregate(Ticker, :count) > 0
  end
end
