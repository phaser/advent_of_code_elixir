defmodule Advent.Year2016.Day07 do
  def part1(ip_addresses) do
    ip_addresses
    |> String.split("\n") |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x ->
      count = String.length(x)
      Range.new(0, count - 5)
      |> Enum.reduce(%{:abba_out_present => false, :abba_in_present => false, :in => false}, fn sp, state ->
        a = String.at(x, sp); b = String.at(x, sp + 1); c = String.at(x, sp + 2); d = String.at(x, sp + 3)
        abba_present = a != b && a == d && b == c
        in_chr = "[" in [a, b, c, d]
        out_chr = "]" in [a, b, c, d]
        %{
          :abba_out_present => (if not state.in and abba_present, do: true, else: state.abba_out_present),
          :abba_in_present => (if state.in and abba_present, do: true, else: state.abba_in_present),
          :in => (if in_chr, do: true, else: (if out_chr, do: false, else: state.in))
        }
      end)
    end)
    |> Enum.count(fn x -> x.abba_out_present && not x.abba_in_present end)
  end

  def part2(args) do
    args
  end
end
