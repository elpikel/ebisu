defmodule Ebisu.Repo.Migrations.UpdateRatesInBitbayTickers do
  use Ecto.Migration

  alias Ebisu.Bitbay.Ticker
  alias Ebisu.Repo

  import Ecto.Query

  def change do
    from(ticker in Ticker, where: is_nil(ticker.rate))
    |> Repo.update_all(set: [rate: 1])
  end
end
