defmodule Advent.Year2015.Day10Test do
  use ExUnit.Case

  import Elixir.Advent.Year2015.Day10

  test "part1" do
    input = "3113322113"
    result = part1(input)

    assert result == 329356
  end

  test "part2" do
    input = "3113322113"
    result = part2(input)

    assert result == 4666278
  end
end
