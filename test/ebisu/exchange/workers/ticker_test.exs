defmodule Ebisu.Exchange.Worker.TickerTest do
  use Ebisu.DataCase

  alias Ebisu.Exchange.Worker.Ticker, as: TickerWorker
  alias Ebisu.Exchange.Ticker

  import Mox

  setup :verify_on_exit!
  setup :set_mox_from_context

  setup do
    http_client = Application.get_env(:ebisu, :http_client)

    Application.put_env(:ebisu, :http_client, Ebisu.Utils.MockHttp)

    on_exit(fn ->
      Application.put_env(:ebisu, :http_client, http_client)
    end)
  end

  test "inserts message" do
    expect(Ebisu.Utils.MockHttp, :get, fn _url ->
      %{
        ask: 1.0,
        bid: 1.0,
        last: 1.0,
        low: 1.0,
        high: 1.0,
        open: 1.0,
        volume: 1.0,
        volumeQuote: 1.0
      }
    end)

    start_supervised(%{
      id: TickerWorker,
      start: {TickerWorker, :start_link, [[interval: 100]]}
    })

    Process.sleep(200)

    assert Repo.aggregate(Ticker, :count) > 0
  end
end
