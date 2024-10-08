defmodule Advent.Year2016.Day06Test do
  use ExUnit.Case

  import Elixir.Advent.Year2016.Day06

  test "part1" do
    input = """
    eedadn
    drvtee
    eandsr
    raavrd
    atevrs
    tsrnev
    sdttsa
    rasrtv
    nssdts
    ntnada
    svetve
    tesnvt
    vntsnd
    vrdear
    dvrsen
    enarar
    """
    result = part1(input)

    assert result == "easter"
  end
end
