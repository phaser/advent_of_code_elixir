defmodule Advent.Year2015.Day05 do
  defp is_nice_part1?(""), do: false

  defp is_nice_part1?(word) do
    graphemes = word |> String.graphemes
    rule1 = (graphemes |> Enum.count(fn l -> l in ["a", "e", "i", "o", "u"] end)) > 2
    rule2 =
      graphemes
      |> Enum.zip(graphemes |> Enum.drop(1))
      |> Enum.any?(fn p -> elem(p, 0) == elem(p, 1) end)
    rule3 = not String.contains?(word, ["ab", "cd", "pq", "xy"])
    rule1 and rule2 and rule3
  end

  def part1(strings) do
    strings
    |> String.split("\n")
    |> Enum.count(&is_nice_part1?/1)
  end

  defp is_nice_part2?(""), do: false

  defp is_nice_part2?(word) do
    graphemes = word |> String.graphemes
    pairs = graphemes |> Enum.zip(graphemes |> Enum.drop(1))
    rule1 = (pairs
    |> Enum.reduce_while(%{count: 0, pairs: pairs}, fn x, acc ->
      if x in (acc.pairs |> Enum.drop(2)), do: {:halt, %{acc | count: 1}}, else: {:cont, %{acc | pairs: (acc.pairs |> Enum.drop(1))}}
    end)).count > 0
    triads =
      graphemes
      |> Enum.zip(graphemes |> Enum.drop(1))
      |> Enum.zip(graphemes |> Enum.drop(2))
      |> Enum.map(fn x -> "#{elem(elem(x, 0), 0)}#{elem(elem(x, 0), 1)}#{elem(x, 1)}" end)
    rule2 =
      triads
      |> Enum.any?(fn t -> String.at(t, 0) == String.at(t, 2) end)
    rule1 and rule2
  end

  def part2(strings) do
    strings
    |> String.split("\n")
    |> Enum.count(&is_nice_part2?/1)
  end
end
