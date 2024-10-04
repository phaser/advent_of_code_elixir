defmodule Advent.Year2015.Day08 do
  def part1(strings) do
    strings
    |> String.split("\n")
    |> Enum.filter(fn s -> s != "" end)
    |> Enum.map(fn x -> {x, String.length(x)} end)
    |> Enum.map(fn x -> {
      String.replace(elem(x,0), "\\\"", "\"")
      |> String.replace(~r/\\x([0-9a-f]{2})/, "%")
      |> String.replace("\\\\", "\\"), elem(x, 1)} end)
    |> Enum.map(fn x -> {elem(x, 0), elem(x, 1), String.length(elem(x, 0)) - 2} end)
    |> Enum.reduce(0, fn x, sum -> sum + elem(x, 1) - elem(x, 2) end)
  end

  def part2(strings) do
    strings
  end
end
