defmodule Elixir.Mix.Tasks.Y2016.D05.P2 do
  use Mix.Task

  import Elixir.Advent.Year2016.Day05

  @shortdoc "Day 05 Part 2"
  def run(args) do
    input = Advent.Input.get!(5, 2016)

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> part2() end}),
      else:
        input
        |> part2()
        |> IO.inspect(label: "Part 2 Results")
  end
end
