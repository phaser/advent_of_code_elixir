defmodule Advent.Year2016.Day04 do
  defp parse_room(room), do: Regex.named_captures(~r/(?<letters>([a-z]-?)+)(?<id>[0-9]+)(?<checksum>\[[a-z]+\])/, room)

  defp sort(x1, x2) do
    c1 = elem(x1, 1) |> Enum.count
    c2 = elem(x2, 1) |> Enum.count
    a1 = elem(x1, 0); a2 = elem(x2, 0)
    if c1 > c2, do: true, else: (if c1 < c2, do: false, else: a1 < a2)
  end

  def part1(rooms) do
    rooms |> String.split("\n") |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(&parse_room/1)
    |> Enum.map(fn x ->
      {id, _} = x["id"] |> Integer.parse()
      letters =
        x["letters"]
        |> String.graphemes()
        |> Enum.filter(fn x -> x != "-" end)
        |> Enum.sort()
        |> Enum.group_by(fn x -> x end)
        |> Map.to_list()
        |> Enum.sort(&sort/2)
        |> Enum.map(fn x -> elem(x, 0) end)
        |> Enum.take(5)
      checksum = x["checksum"] |> String.graphemes() |> Enum.filter(fn x -> x != "[" && x != "]" end)
      %{"checksum" => checksum, "id" => id, "letters" => letters}
    end)
    |> Enum.filter(fn x -> (x["checksum"] |> Enum.join) == (x["letters"] |> Enum.join) end)
    |> Enum.map(fn x -> x["id"] end)
    |> Enum.sum()
  end

  def part2(args) do
    args
  end
end
