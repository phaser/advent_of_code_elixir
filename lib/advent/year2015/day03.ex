defmodule Advent.Year2015.Day03 do
  def part1(args) do
    solution = args
    |> String.graphemes
    |> solution([{0, 0}])
    solution.count
  end

  def part2(args) do
    lists = args
    |> String.graphemes
    |> Enum.with_index
    |> Enum.split_with(fn x -> rem(elem(x, 1), 2) == 0 end)
    solution1 = elem(lists, 0)
    |> Enum.map(fn x -> elem(x, 0) end)
    |> solution([{0, 0}])
    solution2 = elem(lists, 1)
    |> Enum.map(fn x -> elem(x, 0) end)
    |> solution(solution1.visited_positions |> MapSet.to_list)
    solution1.count + solution2.count - 1
  end

  defp solution(list_chars, already_visited) do
    list_chars
    |> Enum.reduce(%{current_position: {0, 0}, visited_positions: MapSet.new(already_visited),  count: 1}, fn x, acc ->
      move = case x do
        ">" -> {1, 0}
        "<" -> {-1, 0}
        "^" -> {0, -1}
        "v" -> {0, 1}
        _ -> raise "Unsupported char #{x}"
      end
      current_position = acc.current_position
      current_position = {elem(current_position, 0) + elem(move, 0), elem(current_position, 1) + elem(move, 1)}
      newMapSet = MapSet.put(acc.visited_positions, current_position)
      count = if MapSet.member?(acc.visited_positions, current_position), do: acc.count, else: acc.count + 1
      %{acc | current_position: current_position, count: count, visited_positions: newMapSet }
    end)
  end
end
