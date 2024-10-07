defmodule Advent.Year2016.Day02 do
  @moves_part1 %{
    1 => %{"L" => 1, "U" => 1, "R" => 2, "D" => 4},
    2 => %{"L" => 1, "U" => 2, "R" => 3, "D" => 5},
    3 => %{"L" => 2, "U" => 3, "R" => 3, "D" => 6},
    4 => %{"L" => 4, "U" => 1, "R" => 5, "D" => 7},
    5 => %{"L" => 4, "U" => 2, "R" => 6, "D" => 8},
    6 => %{"L" => 5, "U" => 3, "R" => 6, "D" => 9},
    7 => %{"L" => 7, "U" => 4, "R" => 8, "D" => 7},
    8 => %{"L" => 7, "U" => 5, "R" => 9, "D" => 8},
    9 => %{"L" => 8, "U" => 6, "R" => 9, "D" => 9},
  }

  @moves_part2 %{
    1 => %{"L" => 1, "U" => 1, "R" => 1, "D" => 3},
    2 => %{"L" => 2, "U" => 2, "R" => 3, "D" => 6},
    3 => %{"L" => 2, "U" => 1, "R" => 4, "D" => 7},
    4 => %{"L" => 3, "U" => 4, "R" => 4, "D" => 8},
    5 => %{"L" => 5, "U" => 5, "R" => 6, "D" => 5},
    6 => %{"L" => 5, "U" => 2, "R" => 7, "D" => 10},
    7 => %{"L" => 6, "U" => 3, "R" => 8, "D" => 11},
    8 => %{"L" => 7, "U" => 4, "R" => 9, "D" => 12},
    9 => %{"L" => 8, "U" => 9, "R" => 9, "D" => 9},
    10 => %{"L" => 10, "U" => 6, "R" => 11, "D" => 10},
    11 => %{"L" => 10, "U" => 7, "R" => 12, "D" => 13},
    12 => %{"L" => 11, "U" => 8, "R" => 12, "D" => 12},
    13 => %{"L" => 13, "U" => 11, "R" => 13, "D" => 13},
  }

  defp solve(commands, moves) do
    commands
    |> String.split("\n") |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x -> x |> String.graphemes() end)
    |> Enum.reduce(%{:pos => 5, :nums => []}, fn cn, state ->
      nextpos = cn
      |> Enum.reduce(%{:pos => state.pos}, fn x, acc ->
        %{:pos => moves[acc.pos][x]}
      end)
      |> Map.get(:pos)
      %{:pos => nextpos, :nums => [nextpos | Map.get(state, :nums)] }
    end)
    |> Map.get(:nums)
    |> Enum.reverse
    |> Enum.map(fn x ->
      case x do
        a when a > 0 and a < 10 -> "#{x}"
        10 -> "A"
        11 -> "B"
        12 -> "C"
        13 -> "D"
      end
    end)
    |> Enum.join
  end

  def part1(commands), do: solve(commands, @moves_part1)
  def part2(commands), do: solve(commands, @moves_part2)
end
