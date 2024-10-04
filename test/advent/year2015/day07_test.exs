defmodule Advent.Year2015.Day07Test do
  use ExUnit.Case

  import Elixir.Advent.Year2015.Day07

  test "part1" do
    input = """
    123 -> x
    456 -> y
    x AND y -> d
    x OR y -> e
    x LSHIFT 2 -> f
    y RSHIFT 2 -> g
    NOT x -> h
    NOT y -> i
    """
    result = part1(input)

    assert :binary.decode_unsigned(result["h"]) == 65412
  end
end
