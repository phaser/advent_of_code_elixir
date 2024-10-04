defmodule Advent.Year2015.Day09Test do
  use ExUnit.Case

  import Elixir.Advent.Year2015.Day09

  test "part1" do
    input = """
    London to Dublin = 464
    London to Belfast = 518
    Dublin to Belfast = 141
    """
    result = part1(input)

    assert result == 605
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
