defmodule EbisuTest do
  use ExUnit.Case
  doctest Ebisu

  test "greets the world" do
    assert Ebisu.hello() == :world
  end
end
