defmodule Ebisu.Cex.Worker.Ticker do
  use GenServer

  alias Ebisu.Cex

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

    Task.start(fn ->
      {:ok, ticker} = Cex.add_ticker()

      Phoenix.PubSub.broadcast(Ebisu.PubSub, "cex_ticker", ticker)
    end)

    {:noreply, state}
  end

  defp schedule_ticker_add(state) do
    Process.send_after(self(), :add_ticker, Keyword.get(state, :interval, @interval))
  end
end
