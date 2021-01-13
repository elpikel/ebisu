defmodule Ebisu.Factories do
  defmodule Bitbay do
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
      vwap: 86_528_207.0,
      rate: 10.0
    }

    def valid_ticker do
      @valid_ticker
    end
  end
end
