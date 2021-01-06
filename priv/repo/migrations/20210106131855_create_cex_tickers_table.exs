defmodule Ebisu.Repo.Migrations.CreateCexTickersTable do
  use Ecto.Migration

  def change do
    create table(:cex_tickers) do
      add(:high, :float)
      add(:low, :float)
      add(:last, :float)
      add(:bid, :float)
      add(:ask, :float)
      add(:volume, :float)

      timestamps(type: :utc_datetime_usec)
    end
  end
end
