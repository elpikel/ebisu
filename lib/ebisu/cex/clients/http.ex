defmodule Ebisu.Cex.Clients.Http do
  alias Ebisu.Utils.Http

  # {"timestamp":"1609955561","low":"32555.4","high":"35800","last":"35093.5","volume":"404.37665147","volume30d":"8054.41100114","bid":35020,"ask":35022.3,"priceChange":"2536.0","priceChangePercentage":"7.79","pair":"BTC:USD"}
  def get_ticker do
    Http.new().get("https://cex.io/api/ticker/BTC/USD")
  end
end
