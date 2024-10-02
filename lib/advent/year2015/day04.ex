defmodule Advent.Year2015.Day04 do
  def part1(secret_key) do
    solution(secret_key, "00000", 0)
  end

  def part2(secret_key) do
    solution(secret_key, "000000", 0)
  end

  defp solution(secret_key, pattern, num) do
    hash = :crypto.hash(:md5, "#{secret_key}#{num}") |> Base.encode16()
    if String.starts_with?(hash, pattern), do: num, else: solution(secret_key, pattern, num + 1)
  end
end
