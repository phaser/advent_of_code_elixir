defmodule Advent.Year2016.Day02Test do
  use ExUnit.Case

  import Elixir.Advent.Year2016.Day02

  test "part1" do
    input = """
    ULL
    RRDDD
    LURDL
    UUUUD
    """
    result = part1(input)

    assert result == "1985"
  end

  test "part2" do
    input = """
    ULL
    RRDDD
    LURDL
    UUUUD
    """
    result = part2(input)

    assert result == "5DB3"
  end
end
