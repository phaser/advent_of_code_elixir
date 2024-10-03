defmodule Advent.Year2015.Day06 do
  defp extract_ranges(start_range, end_range) do
    [x1, y1] = start_range |> String.split(",") |> Enum.map(fn n -> {p, _} = Integer.parse(n); p end)
    [x2, y2] = end_range |> String.split(",") |> Enum.map(fn n -> {p, _} = Integer.parse(n); p end)
    [x1, y1, x2, y2]
  end

  defp parse_explicit_command(["turn", "on", start_range, "through", end_range]) do
    [x1, y1, x2, y2] = extract_ranges(start_range, end_range)
    {"turnon", x1, y1, x2, y2}
  end

  defp parse_explicit_command(["turn", "off", start_range, "through", end_range]) do
    [x1, y1, x2, y2] = extract_ranges(start_range, end_range)
    {"turnoff", x1, y1, x2, y2}
  end

  defp parse_explicit_command(["toggle", start_range, "through", end_range]) do
    [x1, y1, x2, y2] = extract_ranges(start_range, end_range)
    {"toggle", x1, y1, x2, y2}
  end

  defp parse_command(command) do
    command
    |> String.split(" ")
    |> parse_explicit_command
  end

  def part1(commands) do
    commands
    |> String.split("\n")
    |> Enum.filter(fn l -> l != "" end)
    |> Enum.map(&parse_command/1)
    |> Enum.reduce(MapSet.new(), fn x, acc ->
      case x do
        {"turnon", x1, y1, x2, y2} ->
          lights = for x <- Range.new(x1, x2), y <- Range.new(y1, y2), do: {x, y}
          lights
            |> Enum.reduce(acc, fn x, acc -> MapSet.put(acc, x) end)
        {"turnoff", x1, y1, x2, y2} ->
          lights = for x <- Range.new(x1, x2), y <- Range.new(y1, y2), do: {x, y}
          lights
            |> Enum.reduce(acc, fn x, acc -> MapSet.delete(acc, x) end)
        {"toggle", x1, y1, x2, y2} ->
          lights = for x <- Range.new(x1, x2), y <- Range.new(y1, y2), do: {x, y}
          m2 = MapSet.new(lights)
          newMap = MapSet.difference(acc, m2)
          MapSet.union(newMap, MapSet.difference(m2, acc))
      end
    end)
    |> MapSet.size
  end

  def part2(commands) do
    parsed_commands = commands
    |> String.split("\n")
    |> Enum.filter(fn l -> l != "" end)
    |> Enum.map(&parse_command/1)
    light_list = for x <- Range.new(0, 999), y <- Range.new(0, 999), do: {{x, y}, 0}
    lights_map = Map.new(light_list)
    parsed_commands
    |> Enum.reduce(lights_map, fn x, acc ->
      case x do
        {"turnon", x1, y1, x2, y2} ->
          lights = for x <- Range.new(x1, x2), y <- Range.new(y1, y2), do: {x, y}
          lights |> Enum.reduce(acc, fn x, map -> Map.get_and_update!(map, x, fn light_intensity -> {light_intensity, light_intensity + 1} end) |> elem(1) end)
        {"turnoff", x1, y1, x2, y2} ->
          lights = for x <- Range.new(x1, x2), y <- Range.new(y1, y2), do: {x, y}
          lights |> Enum.reduce(acc, fn x, map -> Map.get_and_update!(map, x, fn light_intensity -> {light_intensity, Enum.max([light_intensity - 1, 0])} end) |> elem(1) end)
        {"toggle", x1, y1, x2, y2} ->
          lights = for x <- Range.new(x1, x2), y <- Range.new(y1, y2), do: {x, y}
          lights |> Enum.reduce(acc, fn x, map -> Map.get_and_update!(map, x, fn light_intensity -> {light_intensity, light_intensity + 2} end) |> elem(1) end)
      end
    end)
    |> Enum.reduce(0, fn x, sum -> sum + elem(x, 1) end)
  end
end
