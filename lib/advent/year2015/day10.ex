defmodule Advent.Year2015.Day10 do
  defp solve(start_string, count) do
    Range.new(1, count)
    |> Enum.reduce(start_string |> String.graphemes, fn _, cstate ->
      cstate
      |> Enum.chunk_by(fn x -> x end)
      |> Enum.flat_map(fn x -> ["#{x |> Enum.count()}", hd(x)] end)
    end)
    |> Enum.count()
  end

  def part1(start_string) do
    solve(start_string, 40)
  end

  def part2(start_string) do
    solve(start_string, 50)
  end
end
