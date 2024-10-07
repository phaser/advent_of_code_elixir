defmodule Advent.Year2016.Day01 do
  @orientation %{:N => {0, -1}, :E => {1, 0}, :S => {0, 1}, :W => {-1, 0}}
  @rotCW90 %{:N => :E, :E => :S, :S => :W, :W => :N}
  @rotCCW90 %{:N => :W, :W => :S, :S => :E, :E => :N}

  defp parse_input(commands) do
    commands
    |> Enum.map(fn x ->
      rot = String.at(x, 0)
      {steps, _} = x |> String.slice(Range.new(1, String.length(x) - 1)) |> Integer.parse()
      %{:rotation => rot, :steps => steps}
    end)
  end

  def part1(moves) do
    moves
    |> String.split(", ")
    |> parse_input
    |> Enum.reduce(%{:pos => {0, 0}, :orientation => :N}, fn x, state ->
      cpos = state.pos
      orientation = state.orientation
      omap = case x.rotation do
        "R" -> @rotCW90
        "L" -> @rotCCW90
        _ -> raise "Unknown rotation"
      end
      orientation = omap[orientation]
      cpos = {elem(cpos, 0) + x.steps * elem(@orientation[orientation], 0), elem(cpos, 1) + x.steps * elem(@orientation[orientation], 1)}
      %{:pos => cpos, :orientation => orientation}
    end)
    |> Map.get(:pos)
    |> Tuple.to_list()
    |> Enum.map(fn x -> abs(x) end)
    |> Enum.sum()
  end

  def part2(moves) do
    moves
    |> String.split(", ")
    |> parse_input
    |> Enum.reduce_while(%{:pos => {0, 0}, :orientation => :N, :visited => MapSet.new()}, fn x, state ->
      cpos = state.pos
      orientation = state.orientation
      omap = case x.rotation do
        "R" -> @rotCW90
        "L" -> @rotCCW90
        _ -> raise "Unknown rotation"
      end
      orientation = omap[orientation]
      {result, ms} =
        Range.new(1, x.steps)
        |> Enum.reduce_while({:notfound, state.visited}, fn s, state ->
          visited = elem(state, 1)
          newpos = {elem(cpos, 0) + s * elem(@orientation[orientation], 0), elem(cpos, 1) + s * elem(@orientation[orientation], 1)}
          if MapSet.member?(visited, newpos), do: {:halt, {:found, newpos}}, else: {:cont, {:notfound, MapSet.put(visited, newpos)}}
        end)
      if (result == :found) do
        {:halt, %{:pos => ms}}
      else
        cpos = {elem(cpos, 0) + x.steps * elem(@orientation[orientation], 0), elem(cpos, 1) + x.steps * elem(@orientation[orientation], 1)}
        {:cont, %{:pos => cpos, :orientation => orientation, :visited => ms}}
      end
    end)
    |> Map.get(:pos)
    |> Tuple.to_list()
    |> Enum.map(fn x -> abs(x) end)
    |> Enum.sum()
  end
end
