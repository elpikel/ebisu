defmodule Ebisu.Bitbay.TickerTest do
  use Ebisu.DataCase, async: true

  alias Ebisu.Bitbay.Ticker
  alias Ebisu.Factories.Bitbay

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
          volume: {"can't be blank", [validation: :required]},
          rate: {"can't be blank", [validation: :required]}
        ]
      } = Ticker.changeset(%{})
    end

    test "ticker is valid when all fields are provided" do
      %Ecto.Changeset{
        valid?: true
      } = Ticker.changeset(Bitbay.valid_ticker())
    end
  end
end
