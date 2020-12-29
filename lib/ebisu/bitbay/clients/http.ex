defmodule Ebisu.Bitbay.Clients.Http do
  alias Ebisu.Utils.Http

  # {"max":4500,"min":1465,"last":1533,"bid":1513,"ask":1542,"vwap":1524.42,"average":1545.67,"volume":4.54042857}
  def get_ticker do
    Http.get("https://bitbay.net/API/Public/BTCPLN/ticker.json")
  end

  def get_rate do
    rate = Http.get("http://api.nbp.pl/api/exchangerates/rates/a/usd/?format=json")

    rate
    |> Map.get("rates")
    |> Enum.at(0)
    |> Map.get("mid")
  end
end
