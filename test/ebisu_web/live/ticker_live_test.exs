defmodule EbisuWeb.TickerLiveTest do
  use EbisuWeb.ConnCase

  alias Ebisu.Factories.Bitbay, as: BitbayFactory
  alias Ebisu.Bitbay.Ticker
  alias Ebisu.Bitbay.Worker.Ticker, as: TickerWorker

  alias Ebisu.Repo

  import Mox
  import Phoenix.LiveViewTest

  setup [:verify_on_exit!, :set_mox_from_context]

  test "assigns tickers on mount", %{conn: conn} do
    add_bitbay_ticker()

    conn = get(conn, "/")

    {:ok, view, _html} = live(conn)

    chart_html =
      view
      |> element("#chart")
      |> render()

    assert chart_html ==
             "<canvas id=\"chart\" phx-update=\"ignore\" phx-hook=\"Chart\" data-tickers=\"{&quot;exchange&quot;:[],&quot;cex&quot;:[],&quot;bittrex&quot;:[],&quot;bitbay&quot;:[{&quot;y&quot;:7031507.8,&quot;x&quot;:&quot;13:26:08&quot;}]}\"></canvas>"
  end

  test "assigns received ticker", %{conn: conn} do
    http_client = Application.get_env(:ebisu, :http_client)

    Application.put_env(:ebisu, :http_client, Ebisu.Utils.MockHttp)

    on_exit(fn ->
      Application.put_env(:ebisu, :http_client, http_client)
    end)

    add_bitbay_ticker()

    expect(Ebisu.Utils.MockHttp, :get, 4, fn url ->
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

    conn = get(conn, "/")

    start_supervised(%{
      id: TickerWorker,
      start: {TickerWorker, :start_link, [[interval: 100]]}
    })

    Process.sleep(150)

    {:ok, view, _html} = live(conn)

    assert_push_event(view, "tickers", %{
      tickers: %{
        bitbay: bitbay
      }
    })

    assert Enum.member?(
             bitbay,
             %{x: ~T[13:26:08], y: 7_031_507.8}
           )
  end

  defp add_bitbay_ticker() do
    {:ok, updated_at} = DateTime.from_naive(~N[2020-01-01 13:26:08], "Etc/UTC")
    valid_ticker = BitbayFactory.valid_ticker()

    valid_ticker
    |> Ticker.changeset()
    |> Ecto.Changeset.change(%{updated_at: updated_at})
    |> Repo.insert()
  end
end
