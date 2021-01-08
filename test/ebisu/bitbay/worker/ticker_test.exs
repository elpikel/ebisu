defmodule Ebisu.Bitbay.Worker.TickerTest do
  use Ebisu.DataCase

  alias Ebisu.Bitbay.Worker.Ticker, as: TickerWorker
  alias Ebisu.Bitbay.Ticker

  import Mox

  setup [:verify_on_exit!, :set_mox_from_context]

  setup do
    http_client = Application.get_env(:ebisu, :http_client)

    Application.put_env(:ebisu, :http_client, Ebisu.Utils.MockHttp)

    on_exit(fn ->
      Application.put_env(:ebisu, :http_client, http_client)
    end)
  end

  test "inserts message" do
    expect(Ebisu.Utils.MockHttp, :get, 2, fn url ->
      if url == "https://bitbay.net/API/Public/BTCPLN/ticker.json" do
        %{
          "max" => 4500,
          "min" => 1465,
          "last" => 1533,
          "bid" => 1513,
          "ask" => 1542,
          "vwap" => 1524.42,
          "average" => 1545.67,
          "volume" => 4.54042857
        }
      else
        %{
          "table" => "A",
          "currency" => "dolar amerykański",
          "code" => "USD",
          "rates" => [
            %{"no" => "003/A/NBP/2021", "effectiveDate" => "2021-01-07", "mid" => 3.6656}
          ]
        }
      end
    end)

    start_supervised(%{
      id: TickerWorker,
      start: {TickerWorker, :start_link, [[interval: 100]]}
    })

    Process.sleep(200)

    assert Repo.aggregate(Ticker, :count) > 0
  end
end
