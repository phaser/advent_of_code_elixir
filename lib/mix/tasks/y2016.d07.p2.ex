defmodule Elixir.Mix.Tasks.Y2016.D07.P2 do
  use Mix.Task

  import Elixir.Advent.Year2016.Day07

  @shortdoc "Day 07 Part 2"
  def run(args) do
    input = Advent.Input.get!(7, 2016)

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> part2() end}),
      else:
        input
        |> part2()
        |> IO.inspect(label: "Part 2 Results")
  end
end