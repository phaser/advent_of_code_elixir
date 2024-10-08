defmodule Advent.Year2016.Day06 do
  def part1(words) do
    words
    |> String.split("\n") |> Enum.filter(fn x -> x != "" end)
    |> Enum.flat_map(fn x ->
      x |> String.graphemes |> Enum.with_index()
    end)
    |> Enum.group_by(&elem(&1, 1))
    |> Map.to_list()
    |> Enum.map(&elem(&1, 1))
    |> Enum.map(fn x ->
      x |> Enum.map(&elem(&1, 0)) |> Enum.sort() |> Enum.group_by(fn x -> x end) |> Map.to_list |> Enum.max_by(fn x -> elem(x, 1) |> Enum.count end) |> elem(0)
    end)
    |> Enum.join
  end

  def part2(words) do
    words
    |> String.split("\n") |> Enum.filter(fn x -> x != "" end)
    |> Enum.flat_map(fn x ->
      x |> String.graphemes |> Enum.with_index()
    end)
    |> Enum.group_by(&elem(&1, 1))
    |> Map.to_list()
    |> Enum.map(&elem(&1, 1))
    |> Enum.map(fn x ->
      x |> Enum.map(&elem(&1, 0)) |> Enum.sort() |> Enum.group_by(fn x -> x end) |> Map.to_list |> Enum.min_by(fn x -> elem(x, 1) |> Enum.count end) |> elem(0)
    end)
    |> Enum.join
  end
end
