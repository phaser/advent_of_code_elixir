defmodule Advent.Year2015.Day06Test do
  use ExUnit.Case

  import Elixir.Advent.Year2015.Day06

  test "part1" do
    input = """
    turn on 0,0 through 999,999
    toggle 0,0 through 999,0
    turn off 499,499 through 500,500
    """
    result = part1(input)

    assert result == 998996
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
