defmodule Ebisu.Repo.Migrations.AddRateToBitbayTickersTable do
  use Ecto.Migration

  def change do
    alter table(:bitbay_tickers) do
      add :rate, :float
    end
  end
end
