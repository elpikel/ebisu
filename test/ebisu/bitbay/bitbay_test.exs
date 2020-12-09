defmodule Ebisu.BitbayTest do
  use Ebisu.RepoCase

  alias Ebisu.Bitbay

  test "adds ticker" do
    {:ok, _changeset} = Bitbay.add_ticker()
  end
end
