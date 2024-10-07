defmodule Elixir.Mix.Tasks.Y2015.D10.P1 do
  use Mix.Task

  import Elixir.Advent.Year2015.Day10

  @shortdoc "Day 10 Part 1"
  def run(args) do
    input = Advent.Input.get!(10, 2015)

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> part1() end}),
      else:
        input
        |> part1()
        |> IO.inspect(label: "Part 1 Results")
  end
end