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
end
