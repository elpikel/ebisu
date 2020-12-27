defmodule EbisuWeb.PageLive do
  use EbisuWeb, :live_view

  alias Ebisu.Bitbay.Ticker, as: BitbayTicker

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Phoenix.PubSub.subscribe(Ebisu.PubSub, "ticker")
    end

    {:ok, assign(socket, ticker: %{})}
  end

  @impl true
  def handle_info(%BitbayTicker{} = ticker, socket) do
    {:noreply, assign(socket, ticker: ticker)}
  end
end
