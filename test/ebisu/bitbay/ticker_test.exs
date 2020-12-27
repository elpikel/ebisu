defmodule Ebisu.Bitbay.TickerTest do
  use Ebisu.DataCase

  alias Ebisu.Bitbay.Ticker

  @valid_ticker %{
    ask: 28_533_161.0,
    average: 81_712_978.0,
    bid: 33_061_732.0,
    id: 95_769_487,
    inserted_at: ~U[2020-12-08 19:59:14Z],
    last: 70_315_078.0,
    max: 21_647_178.0,
    min: 46_794_371.0,
    updated_at: ~U[2020-12-08 19:59:14Z],
    volume: 61_700_119.0,
    vwap: 86_528_207.0
  }

  describe "changeset/1" do
    test "returns error when fields are missing" do
      %Ecto.Changeset{
        valid?: false,
        errors: [
          max: {"can't be blank", [validation: :required]},
          min: {"can't be blank", [validation: :required]},
          last: {"can't be blank", [validation: :required]},
          bid: {"can't be blank", [validation: :required]},
          ask: {"can't be blank", [validation: :required]},
          vwap: {"can't be blank", [validation: :required]},
          average: {"can't be blank", [validation: :required]},
          volume: {"can't be blank", [validation: :required]}
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
