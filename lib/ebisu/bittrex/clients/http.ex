defmodule Ebisu.Bittrex.Clients.Http do
  alias Ebisu.Utils.Http

  # {"symbol":"BTC-USD","lastTradeRate":"34829.99900000","bidRate":"34685.28900000","askRate":"34838.93300000"}
  def get_ticker do
    Http.new().get("https://api.bittrex.com/v3/markets/BTC-USD/ticker")
  end

  # {"symbol":"BTC-USD","high":"35000.00000000","low":"32298.37000000","volume":"830.20201328","quoteVolume":"28193216.46864385","percentChange":"6.34","updatedAt":"2021-01-06T17:08:49.56Z"}
  def get_summary do
    Http.new().get("https://api.bittrex.com/v3/markets/BTC-USD/summary")
  end
end
