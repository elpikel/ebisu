defmodule Ebisu.Bittrex.Worker.TickerTest do
  use Ebisu.DataCase

  alias Ebisu.Bittrex.Worker.Ticker, as: TickerWorker
  alias Ebisu.Bittrex.Ticker

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
      if url == "https://api.bittrex.com/v3/markets/BTC-USD/ticker" do
        %{
          "symbol" => "BTC-USD",
          "lastTradeRate" => "34829.99900000",
          "bidRate" => "34685.28900000",
          "askRate" => "34838.93300000"
        }
      else
        %{
          "symbol" => "BTC-USD",
          "high" => "35000.00000000",
          "low" => "32298.37000000",
          "volume" => "830.20201328",
          "quoteVolume" => "28193216.46864385",
          "percentChange" => "6.34",
          "updatedAt" => "2021-01-06T17:08:49.56Z"
        }
      end
    end)

    start_supervised(%{
      id: TickerWorker,
      start: {TickerWorker, :start_link, [[interval: 100]]}
    })

    Process.sleep(150)

    assert Repo.aggregate(Ticker, :count) > 0
  end
end
