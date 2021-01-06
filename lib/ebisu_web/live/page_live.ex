defmodule EbisuWeb.PageLive do
  use EbisuWeb, :live_view

  alias Ebisu.Bitbay
  alias Ebisu.Bitbay.Ticker, as: BitbayTicker
  alias Ebisu.Exchange
  alias Ebisu.Exchange.Ticker, as: ExchangeTicker
  alias Ebisu.Bittrex
  alias Ebisu.Bittrex.Ticker, as: BittrexTicker
  alias Ebisu.Cex
  alias Ebisu.Cex.Ticker, as: CexTicker

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Phoenix.PubSub.subscribe(Ebisu.PubSub, "bitbay_ticker")
      Phoenix.PubSub.subscribe(Ebisu.PubSub, "exchange_ticker")
      Phoenix.PubSub.subscribe(Ebisu.PubSub, "bittrex_ticker")
      Phoenix.PubSub.subscribe(Ebisu.PubSub, "cex_ticker")
    end

    {:ok,
     assign(socket,
       tickers: %{
         bitbay: format(Bitbay.tickers()),
         exchange: format(Exchange.tickers()),
         bittrex: format(Bittrex.tickers()),
         cex: format(Cex.tickers())
       }
     )}
  end

  @impl true
  def handle_info(%ExchangeTicker{} = ticker, socket) do
    handle_new_ticker(ticker, socket, :exchange)
  end

  @impl true
  def handle_info(%BitbayTicker{} = ticker, socket) do
    handle_new_ticker(ticker, socket, :bitbay)
  end

  @impl true
  def handle_info(%BittrexTicker{} = ticker, socket) do
    handle_new_ticker(ticker, socket, :bittrex)
  end

  @impl true
  def handle_info(%CexTicker{} = ticker, socket) do
    handle_new_ticker(ticker, socket, :cex)
  end

  defp handle_new_ticker(ticker, socket, type) do
    tickers =
      socket.assigns.tickers
      |> Map.get(type)
      |> add(ticker)
      |> window()

    tickers = Map.put(socket.assigns.tickers, type, tickers)

    socket = assign(socket, tickers: tickers)

    {:noreply, push_event(socket, "tickers", %{tickers: tickers})}
  end

  defp add(tickers, ticker) do
    tickers ++ [format(ticker)]
  end

  defp format(tickers) when is_list(tickers) do
    Enum.map(tickers, fn ticker -> format(ticker) end)
  end

  defp format(%BitbayTicker{} = ticker) do
    %{x: DateTime.to_time(ticker.updated_at), y: ticker.last / ticker.rate}
  end

  defp format(ticker) do
    %{x: DateTime.to_time(ticker.updated_at), y: ticker.last}
  end

  defp window(tickers) do
    Enum.take(tickers, -20)
  end
end
