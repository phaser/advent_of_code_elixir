defmodule Advent.Year2015.Day07 do
  import Bitwise

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

  defp can_get_value?(state, op) do
    Integer.parse(op) != :error or Map.has_key?(state, op)
  end

  defp can_execute?(state, {_op, right, _dest}), do: can_get_value?(state, right)
  defp can_execute?(state, {_op, left, right, _dest}), do: can_get_value?(state, left) and can_get_value?(state, right)

  defp get_value(state, op) do
    value = Integer.parse(op)
    if value == :error, do: Map.get(state, op), else: :binary.encode_unsigned(elem(value, 0))
  end

  defp getlr_values(state, left, right) do
    left_value = :binary.decode_unsigned(get_value(state, left))
    right_value = :binary.decode_unsigned(get_value(state, right))
    {left_value, right_value}
  end

  defp execute(state, {"assign", right, dest}) do
    value = get_value(state, right)
    Map.put(state, dest, value)
  end

  defp execute(state, {"not", right, dest}) do
    value = get_value(state, right)
    value = :binary.decode_unsigned(value)
    value = (~~~value) &&& 0xffff
    Map.put(state, dest, :binary.encode_unsigned(value))
  end

  defp execute(state, {"and", left, right, dest}) do
    {left_value, right_value} = getlr_values(state, left, right)
    value = left_value &&& right_value
    Map.put(state, dest, :binary.encode_unsigned(value))
  end

  defp execute(state, {"or", left, right, dest}) do
    {left_value, right_value} = getlr_values(state, left, right)
    value = left_value ||| right_value
    Map.put(state, dest, :binary.encode_unsigned(value))
  end

  defp execute(state, {"lsh", left, right, dest}) do
    {left_value, right_value} = getlr_values(state, left, right)
    value = (left_value <<< right_value) &&& 0xffff
    Map.put(state, dest, :binary.encode_unsigned(value))
  end

  defp execute(state, {"rsh", left, right, dest}) do
    {left_value, right_value} = getlr_values(state, left, right)
    value = left_value >>> right_value
    Map.put(state, dest, :binary.encode_unsigned(value))
  end

  defp simulate_circuit(commands, initial_state) do
    Range.new(0, commands |> Enum.count())
    |> Enum.reduce_while(%{:instructions => commands, :state => initial_state}, fn _, iteration ->
      to_execute_idx = iteration.instructions |> Enum.find_index(fn cmd -> can_execute?(iteration.state, cmd) end)
      if (to_execute_idx == nil) do
        {:halt, iteration.state}
      else
        to_execute = iteration.instructions |> Enum.at(to_execute_idx)
        new_instructions = List.delete_at(iteration.instructions, to_execute_idx)
        new_state = execute(iteration.state, to_execute)
        {:cont, %{iteration | :instructions => new_instructions, :state => new_state}}
      end
    end)
  end

  def part1(instructions) do
    commands = instructions
    |> String.split("\n")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(&parse_command/1)

    simulate_circuit(commands, %{})
  end

  def part2(instructions) do
    commands = instructions
    |> String.split("\n")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(&parse_command/1)
    |> Enum.filter(fn cmd -> not(elem(cmd, 0) == "assign" && elem(cmd, 2) == "b") end)

    simulate_circuit(commands, %{"b" => :binary.encode_unsigned(3176)})
  end
end
