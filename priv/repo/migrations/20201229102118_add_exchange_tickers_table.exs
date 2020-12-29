defmodule Ebisu.Repo.Migrations.AddExchangeTickersTable do
  use Ecto.Migration

  def change do
    create table(:exchange_tickers) do
      add(:ask, :float)
      add(:bid, :float)
      add(:last, :float)
      add(:low, :float)
      add(:high, :float)
      add(:open, :float)
      add(:volume, :float)
      add(:volumeQuote, :float)

      timestamps(type: :utc_datetime_usec)
    end
  end
end
