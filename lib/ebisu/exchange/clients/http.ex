defmodule Ebisu.Exchange.Clients.Http do
  alias Ebisu.Utils.Http

  # {"symbol":"BTCUSD","ask":"26800.00","bid":"26799.87","last":"26800.00","low":"25876.00","high":"27459.72","open":"26845.07","volume":"49797.83740","volumeQuote":"1335381086.7896093","timestamp":"2020-12-29T10:10:35.498Z"}
  def get_ticker do
    Http.get("https://api.exchange.bitcoin.com/api/2/public/ticker/BTCUSD")
  end
end
