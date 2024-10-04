defmodule Advent.Year2015.Day08Test do
  use ExUnit.Case

  import Elixir.Advent.Year2015.Day08
  @input_path Path.expand(".", __DIR__)

  test "part1" do
    result = part1(File.read!(Path.join([@input_path, "day08_test_input.p1.txt"])))
    assert result == 13
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
