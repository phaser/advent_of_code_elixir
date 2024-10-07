defmodule Elixir.Mix.Tasks.Y2016.D02.P2 do
  use Mix.Task

  import Elixir.Advent.Year2016.Day02

  @shortdoc "Day 02 Part 2"
  def run(args) do
    input = Advent.Input.get!(2, 2016)

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> part2() end}),
      else:
        input
        |> part2()
        |> IO.inspect(label: "Part 2 Results")
  end
end
