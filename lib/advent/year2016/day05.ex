defmodule Advent.Year2016.Day05 do
  defp solution(secret_key, pattern, num) do
    hash = :crypto.hash(:md5, "#{secret_key}#{num}") |> Base.encode16()
    if String.starts_with?(hash, pattern), do: num, else: solution(secret_key, pattern, num + 1)
  end

  defp solution_by(secret_key, num, fun) do
    hash = :crypto.hash(:md5, "#{secret_key}#{num}") |> Base.encode16()
    if fun.(hash), do: num, else: solution_by(secret_key, num + 1, fun)
  end

  def part1(key) do
    key = key |> String.trim()
    Range.new(1, 8)
    |> Enum.reduce(%{:cnum =>  0, :list => []}, fn _, list ->
      num = solution(key, "00000", list.cnum)
      hash = :crypto.hash(:md5, "#{key}#{num}") |> Base.encode16() |> String.downcase()
      %{list | :cnum => num + 1, :list => [String.at(hash, 5) | list.list]}
     end)
    |> Map.get(:list)
    |> Enum.reverse()
    |> Enum.join()
  end

  def part2(key) do
    key = key |> String.trim()
    Range.new(1, 8)
    |> Enum.reduce(%{:cnum =>  0, :list => [], :valid_positions => ["0", "1", "2", "3", "4", "5", "6", "7"]}, fn _, list ->
      num = solution_by(key, list.cnum, fn hash -> String.starts_with?(hash, "00000") && String.at(hash, 5) in list.valid_positions end)
      hash = :crypto.hash(:md5, "#{key}#{num}") |> Base.encode16() |> String.downcase()
      %{list | :cnum => num + 1, :list => [{String.at(hash, 5), String.at(hash, 6)} | list.list], :valid_positions => list.valid_positions -- [String.at(hash, 5)]}
     end)
    |> Map.get(:list)
    |> Enum.sort_by(&elem(&1, 0))
    |> Enum.map(fn x -> elem(x, 1) end)
    |> Enum.join()
  end
end
