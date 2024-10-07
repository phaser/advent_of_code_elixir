defmodule Advent.Year2016.Day03 do
  def part1(triangles) do
    triangles
    |> String.split("\n") |> Enum.map(&String.trim/1) |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x ->
      x
      |> String.split(" ")
      |> Enum.map(&String.trim/1) |> Enum.filter(fn x -> x != "" end)
      |> Enum.map(fn e -> {edge, _} = Integer.parse(e); edge end)
      |> List.to_tuple()
    end)
    |> Enum.count(fn x ->
      a = elem(x, 0); b = elem(x, 1); c = elem(x, 2)
      a + b > c && a + c > b && b + c > a
    end)
  end

  def part2(triangles) do
    triangles
    |> String.split("\n") |> Enum.map(&String.trim/1) |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x ->
      x
      |> String.split(" ")
      |> Enum.map(&String.trim/1) |> Enum.filter(fn x -> x != "" end)
      |> Enum.map(fn e -> {edge, _} = Integer.parse(e); edge end)
      |> List.to_tuple()
    end)
    |> Enum.chunk_every(3)
    |> Enum.flat_map(fn x ->
      a = Enum.at(x, 0); b = Enum.at(x, 1); c = Enum.at(x, 2)
      [{elem(a, 0), elem(b, 0), elem(c, 0)}, {elem(a, 1), elem(b, 1), elem(c, 1)}, {elem(a, 2), elem(b, 2), elem(c, 2)}]
    end)
    |> Enum.count(fn x ->
      a = elem(x, 0); b = elem(x, 1); c = elem(x, 2)
      a + b > c && a + c > b && b + c > a
    end)
  end
end
