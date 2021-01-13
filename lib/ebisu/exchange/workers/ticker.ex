defmodule Ebisu.Exchange.Worker.Ticker do
  use GenServer

  alias Ebisu.Exchange

  @interval Application.fetch_env!(:ebisu, :exchange_worker_interval)

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state)
  end

  def init(state) do
    schedule_ticker_add(state)

    {:ok, state}
  end

  def handle_info(:add_ticker, state) do
    schedule_ticker_add(state)

    {:ok, ticker} = Exchange.add_ticker()

    Phoenix.PubSub.broadcast(Ebisu.PubSub, "exchange_ticker", ticker)

    {:noreply, state}
  end

  defp schedule_ticker_add(state) do
    Process.send_after(self(), :add_ticker, Keyword.get(state, :interval, @interval))
  end
end
