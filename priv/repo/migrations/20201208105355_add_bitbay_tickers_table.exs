defmodule Ebisu.Repo.Migrations.AddBitbayTickersTable do
  use Ecto.Migration

  def change do
    create table(:bitbay_tickers) do
      add(:max, :float)
      add(:min, :float)
      add(:last, :float)
      add(:bid, :float)
      add(:ask, :float)
      add(:vwap, :float)
      add(:average, :float)
      add(:volume, :float)

      timestamps(type: :utc_datetime_usec)
    end
  end
end
