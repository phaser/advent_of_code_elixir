defmodule Advent.Year2016.Day07Test do
  use ExUnit.Case

  import Elixir.Advent.Year2016.Day07

  test "part1" do
    input = """
    wysextplwqpvipxdv[srzvtwbfzqtspxnethm]syqbzgtboxxzpwr[kljvjjkjyojzrstfgrw]obdhcczonzvbfby[svotajtpttohxsh]cooktbyumlpxostt
    abba[mnop]qrst
    """
    result = part1(input)

    assert result == 1
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
