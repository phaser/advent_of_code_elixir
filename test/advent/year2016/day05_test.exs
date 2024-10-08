defmodule Advent.Year2016.Day05Test do
  use ExUnit.Case

  import Elixir.Advent.Year2016.Day05

  test "part1" do
    input = "ffykfhsq"
    result = part1(input)

    assert result == "18f47a30"
  end
end
