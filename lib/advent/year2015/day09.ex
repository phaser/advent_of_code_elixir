defmodule Advent.Year2015.Day09 do
  @infinity 10000

  defp parse_distance(line) do
    [city1, "to", city2, "=", dist] = line |> String.split(" ")
    {dist_value, _} = Integer.parse(dist)
    [%{:city1 => city1, :city2 => city2, :dist => dist_value}]
  end

  defp permutations([]), do: [[]]
  defp permutations(list) do
    for elem <- list, rest <- permutations(list -- [elem]), do: [elem | rest]
  end

  defp parse_input(costs_input) do
    costs_input
    |> String.split("\n")
    |> Enum.filter(fn s -> s != "" end)
    |> Enum.flat_map(&parse_distance/1)
    |> Enum.sort_by(&Map.get(&1, :dist))
  end

  defp get_cities_list(distsMap) do
    distsMap
    |> Enum.flat_map(fn x -> [x.city1, x.city2] end)
    |> Enum.uniq()
  end

  def part1(costs_input) do
    distsMap = parse_input(costs_input)
    cities = get_cities_list(distsMap)

    cities
    |> permutations()
    |> Enum.map(fn p -> p |> Enum.zip(p |> Enum.drop(1)) |> Enum.reduce(0, fn x, sum ->
      e = distsMap |> Enum.find(fn y -> (elem(x, 0) == y.city1 && elem(x, 1) == y.city2) || (elem(x, 0) == y.city2 && elem(x, 1) == y.city1) end)
      dist = if e == nil, do: @infinity, else: e.dist
      sum + dist
    end)
    end)
    |> Enum.min
  end

  def part2(costs_input) do
    distsMap = parse_input(costs_input)
    cities = get_cities_list(distsMap)

    cities
    |> permutations()
    |> Enum.map(fn p -> p |> Enum.zip(p |> Enum.drop(1)) |> Enum.reduce(0, fn x, sum ->
      e = distsMap |> Enum.find(fn y -> (elem(x, 0) == y.city1 && elem(x, 1) == y.city2) || (elem(x, 0) == y.city2 && elem(x, 1) == y.city1) end)
      dist = if e == nil, do: @infinity, else: e.dist
      sum + dist
    end)
    end)
    |> Enum.max
  end
end
