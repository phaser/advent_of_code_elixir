defmodule Advent.Year2015.Day05Test do
  use ExUnit.Case

  import Elixir.Advent.Year2015.Day05

  test "part1" do
    input = """
    ugknbfddgicrmopn
    aaa
    jchzalrnumimnmhp
    haegwjzuvuyypxyu
    dvszwmarrgswjxmb
    """
    result = part1(input)

    assert result == 2
  end

  test "part2" do
    input = """
    qjhvhtzxzqqjkmpb
    xxyxx
    uurcxstgmygtbstg
    ieodomkazucvgmuy
    """
    result = part2(input)

    assert result == 2
  end
end
