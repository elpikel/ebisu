defmodule Ebisu.Bitbay.Ticker do
  use Ecto.Schema

  import Ecto.Changeset

  @fields [:max, :min, :last, :bid, :ask, :vwap, :average, :volume]

  schema "bitbay_tickers" do
    field(:max, :float)
    field(:min, :float)
    field(:last, :float)
    field(:bid, :float)
    field(:ask, :float)
    field(:vwap, :float)
    field(:average, :float)
    field(:volume, :float)

    timestamps(type: :utc_datetime)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
