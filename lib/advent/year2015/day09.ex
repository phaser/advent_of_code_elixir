defmodule Advent.Year2015.Day09 do
  @infinity 10000

  defp parse_distance(line) do
    [city1, "to", city2, "=", dist] = line |> String.split(" ")
    {dist_value, _} = Integer.parse(dist)
    [{{city1, city2}, dist_value}, {{city1, city2}, dist_value}]
  end

  defp get_dist(distMap, c1, c2) do
    if c1 == c2 do
      0
    else
      key = {c1, c2}
      if Map.has_key?(distMap, key) do
        Map.get(distMap, key)
      else
        @infinity
      end
    end
  end

  defp permutations([]), do: [[]]
  defp permutations(list) do
    for elem <- list, rest <- permutations(list -- [elem]), do: [elem | rest]
  end

  def part1(costs_input) do
    distsMap =
      costs_input
      |> String.split("\n")
      |> Enum.filter(fn s -> s != "" end)
      |> Enum.map(&parse_distance/1)
      |> Enum.flat_map(fn x -> x end)
      |> Map.new

    cities =
      distsMap
      |> Enum.reduce(MapSet.new(), fn x, acc ->
        acc = MapSet.put(acc, elem(elem(x, 0), 0))
        MapSet.put(acc, elem(elem(x, 0), 1))
      end)
      |> MapSet.to_list()
      |> Enum.sort()

    combinations = for k <- cities, i <- cities, j <- cities, do: {k, i, j}
    distsMap = combinations
    |> Enum.reduce(distsMap, fn x, map ->
      k = elem(x, 0)
      i = elem(x, 1)
      j = elem(x, 2)
      cdist = get_dist(map, i, j)
      fd1 = get_dist(map, i, k)
      fd2 = get_dist(map, k, j)
      fd = min(min(cdist, fd1 + fd2), @infinity)
      if @infinity != fd and fd != 0 do
        Map.put(map, {i, j}, fd)
      else
        map
      end
    end)

    cities
    |> permutations()
    |> Enum.map(fn p -> p |> Enum.zip(p |> Enum.drop(1)) |> Enum.reduce(0, fn x, sum -> (sum + get_dist(distsMap, elem(x, 0), elem(x, 1))) end) end)
    |> Enum.min
  end

  def part2(args) do
    args
  end
end
