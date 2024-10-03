defmodule Elixir.Mix.Tasks.Y2015.D06.P2 do
  use Mix.Task

  import Elixir.Advent.Year2015.Day06

  @shortdoc "Day 06 Part 2"
  def run(args) do
    input = Advent.Input.get!(6, 2015)

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> part2() end}),
      else:
        input
        |> part2()
        |> IO.inspect(label: "Part 2 Results")
  end
end
