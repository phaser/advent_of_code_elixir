defmodule Advent.Year2015.Day07 do
  defp parse_components([left, "AND", right, "->", dest]), do: {"and", left, right, dest}
  defp parse_components([left, "OR", right, "->", dest]), do: {"or", left, right, dest}
  defp parse_components([left, "LSHIFT", right, "->", dest]), do: {"lsh", left, right, dest}
  defp parse_components([left, "RSHIFT", right, "->", dest]), do: {"rsh", left, right, dest}
  defp parse_components(["NOT", right, "->", dest]), do: {"not", right, dest}
  defp parse_components([right, "->", dest]), do: {"assign", right, dest}

  defp parse_command(command) do
    command
    |> String.split(" ")
    |> parse_components()
  end

  def part1(instructions) do
    instructions
    |> String.split("\n")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(&parse_command/1)
    |> IO.inspect
  end

  def part2(args) do
    args
  end
end
