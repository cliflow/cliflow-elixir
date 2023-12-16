defmodule CliflowTest do
  use ExUnit.Case
  doctest Cliflow

  test "greets the world" do
    assert Cliflow.hello() == :world
  end
end
