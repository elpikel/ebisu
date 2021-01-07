defmodule Ebisu.Bittrex.TickerTest do
  use Ebisu.DataCase

  alias Ebisu.Bittrex.Ticker

  @valid_ticker %{
    high: 28_533_161.0,
    low: 81_712_978.0,
    bid: 33_061_732.0,
    volume: 95_769_487,
    inserted_at: ~U[2020-12-08 19:59:14Z],
    quoteVolume: 70_315_078.0,
    last: 21_647_178.0,
    updated_at: ~U[2020-12-08 19:59:14Z],
    ask: 61_700_119.0
  }

  describe "changeset/1" do
    test "returns error when fields are missing" do
      %Ecto.Changeset{
        valid?: false,
        errors: [
          high: {"can't be blank", [validation: :required]},
          low: {"can't be blank", [validation: :required]},
          volume: {"can't be blank", [validation: :required]},
          quoteVolume: {"can't be blank", [validation: :required]},
          last: {"can't be blank", [validation: :required]},
          bid: {"can't be blank", [validation: :required]},
          ask: {"can't be blank", [validation: :required]}
        ]
      } = Ticker.changeset(%{})
    end

    test "ticker is valid when all fields are provided" do
      %Ecto.Changeset{
        valid?: true
      } = Ticker.changeset(@valid_ticker)
    end
  end
end
