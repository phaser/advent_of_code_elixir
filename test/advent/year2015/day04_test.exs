defmodule Advent.Year2015.Day04Test do
  use ExUnit.Case

  import Elixir.Advent.Year2015.Day04

  @tag :skip
  test "part1_solution" do
    input = "ckczppom"
    result = part1(input)
    assert result == 117946
  end

  @tag :skip
  test "part2_solution" do
    input = "ckczppom"
    result = part2(input)
    assert result == 3938038
  end

  test "part1" do
    input = "abcdef"
    result = part1(input)
    assert result == 609043

    input = "pqrstuv"
    result = part1(input)
    assert result == 1048970
  end
end
