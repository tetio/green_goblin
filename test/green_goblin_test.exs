defmodule GreenGoblinTest do
  use ExUnit.Case
  doctest GreenGoblin

  test "greets the world" do
    assert GreenGoblin.hello() == :world
  end
end
