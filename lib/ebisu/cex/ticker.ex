defmodule Ebisu.Cex.Ticker do
  use Ecto.Schema

  import Ecto.Changeset

  @fields [:high, :low, :volume, :last, :bid, :ask]

  schema "cex_tickers" do
    field(:high, :float)
    field(:low, :float)
    field(:volume, :float)
    field(:last, :float)
    field(:bid, :float)
    field(:ask, :float)

    timestamps(type: :utc_datetime)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
