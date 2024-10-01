defmodule Advent.Year2015.Day01Test do
  use ExUnit.Case

  import Elixir.Advent.Year2015.Day01

  test "part1" do
    input = "(())"
    result = part1(input)
    assert result == 0

    input = "()()"
    result = part1(input)
    assert result == 0

    input = "((("
    result = part1(input)
    assert result == 3

    input = "())"
    result = part1(input)
    assert result == -1
  end

  test "part2" do
    input = ")"
    result = part2(input)
    assert result == 1

    input = "()())"
    result = part2(input)
    assert result == 5
  end
end
