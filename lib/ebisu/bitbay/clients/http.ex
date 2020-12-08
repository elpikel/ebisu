defmodule Ebisu.Bitbay.Clients.Http do
  @timeout 5000

  # {"max":4500,"min":1465,"last":1533,"bid":1513,"ask":1542,"vwap":1524.42,"average":1545.67,"volume":4.54042857}
  def get_ticker do
    {:ok, ticker} = get("https://bitbay.net/API/Public/BTCPLN/ticker.json")

    ticker
  end

  defp get(url) do
    case HTTPoison.get(url, [{"content-type", "application/json"}], recv_timeout: @timeout) do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        Jason.decode(body)

      {:ok, %HTTPoison.Response{body: body}} ->
        {:error, body}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end
