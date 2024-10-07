defmodule Advent.Year2016.Day01Test do
  use ExUnit.Case

  import Elixir.Advent.Year2016.Day01

  test "part1" do
    input = "R2, L3"
    result = part1(input)
    assert result == 5

    input = "R2, R2, R2"
    result = part1(input)
    assert result == 2

    input = "R5, L5, R5, R3"
    result = part1(input)
    assert result == 12
  end

  test "part2" do
    input = "R8, R4, R4, R8"
    result = part2(input)
    assert result == 4
  end
end
