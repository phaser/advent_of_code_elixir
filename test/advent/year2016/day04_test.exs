defmodule Advent.Year2016.Day04Test do
  use ExUnit.Case

  import Elixir.Advent.Year2016.Day04

  test "part1" do
    input = """
    aaaaa-bbb-z-y-x-123[abxyz]
    a-b-c-d-e-f-g-h-987[abcde]
    not-a-real-room-404[oarel]
    totally-real-room-200[decoy]
    """
    result = part1(input)

    assert result == 1514
  end
end
