defmodule Advent.Year2016.Day03Test do
  use ExUnit.Case

  import Elixir.Advent.Year2016.Day03

  @tag :skip
  test "part1" do
    input = """
    5 10 25
    775  785  361
    """
    result = part1(input)

    assert result == 1
  end

  test "part2" do
    input = """
    101 301 501
    102 302 502
    103 303 503
    201 401 601
    202 402 602
    203 403 603
    """
    result = part2(input)

    assert result == 6
  end
end
