defmodule Ebisu.Exchange.Ticker do
  use Ecto.Schema

  import Ecto.Changeset

  @fields [:ask, :bid, :last, :low, :high, :open, :volume, :volumeQuote]

  schema "exchange_tickers" do
    field(:ask, :float)
    field(:bid, :float)
    field(:last, :float)
    field(:low, :float)
    field(:high, :float)
    field(:open, :float)
    field(:volume, :float)
    field(:volumeQuote, :float)

    timestamps(type: :utc_datetime)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
