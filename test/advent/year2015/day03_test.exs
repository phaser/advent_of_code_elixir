defmodule Advent.Year2015.Day03Test do
  use ExUnit.Case

  import Elixir.Advent.Year2015.Day03

  test "part1" do
    input = "^>v<"
    result = part1(input)
    assert result == 4

    input = "^v^v^v^v^v"
    result = part1(input)
    assert result == 2
  end

  test "part2" do
    input = "^v"
    result = part2(input)
    assert result == 3

    input = "^>v<"
    result = part2(input)
    assert result == 3

    input = "^v^v^v^v^v"
    result = part2(input)
    assert result == 11
  end
end
