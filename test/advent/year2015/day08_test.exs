defmodule Advent.Year2015.Day08Test do
  use ExUnit.Case

  import Elixir.Advent.Year2015.Day08
  @input_path Path.expand(".", __DIR__)

  test "part1" do
    result = part1(File.read!(Path.join([@input_path, "day08_test_input.p1.txt"])))
    assert result == 12
  end

  test "part2" do
    result = part2(File.read!(Path.join([@input_path, "day08_test_input.p1.txt"])))
    assert result == 19
  end
end
