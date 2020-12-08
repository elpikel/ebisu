defmodule Ebisu.BitbayTest do
  use ExUnit.Case

  alias Ebisu.Bitbay

  test "adds ticker" do
    {:ok, changeset} = Bitbay.add_ticker() |> IO.inspect()
  end
end
