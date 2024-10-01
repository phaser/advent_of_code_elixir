defmodule Advent.Year2015.Day01 do
  def part1(args) do
    args
    |> String.graphemes()
    |> Enum.map(fn c -> if c == "(", do: 1, else: -1 end)
    |> Enum.sum()
  end

  def part2(args) do
    args
    |> String.graphemes()
    |> Enum.map(fn c -> if c == "(", do: 1, else: -1 end)
    |> Enum.with_index()
    |> Enum.reduce_while(0, fn x, acc ->
      if acc + elem(x, 0) > -1, do: {:cont, acc + elem(x, 0)}, else: {:halt, elem(x, 1) + 1}
    end)
  end
end
