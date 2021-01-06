defmodule Ebisu.Repo.Migrations.CreateBittrexTickersTable do
  use Ecto.Migration

  def change do
    create table(:bittrex_tickers) do
      add(:high, :float)
      add(:low, :float)
      add(:last, :float)
      add(:bid, :float)
      add(:ask, :float)
      add(:volume, :float)
      add(:quoteVolume, :float)

      timestamps(type: :utc_datetime_usec)
    end
  end
end
