defmodule Advent.Year2015.Day02 do
  def part1(args) do
    args
    |> String.split("\n")
    |> Enum.map(&get_area_wrapping_paper/1)
    |> Enum.sum
  end

  def part2(args) do
    args
    |> String.split("\n")
    |> Enum.map(&get_area_wrapping_ribbon/1)
    |> Enum.sum
  end

  def get_area_wrapping_paper(""), do: 0

  def get_area_wrapping_paper(testcase) do
    [l, w, h] =
      testcase
      |> String.split("x")
      |> Enum.map(fn n ->
        {num, _} = Integer.parse(n)
        num
      end)
    2*l*w + 2*w*h + 2*h*l + Enum.min([l*w, w*h, h*l])
  end

  def get_area_wrapping_ribbon(""), do: 0

  def get_area_wrapping_ribbon(testcase) do
    [l, w, h] =
      testcase
      |> String.split("x")
      |> Enum.map(fn n ->
        {num, _} = Integer.parse(n)
        num
      end)
    l*w*h + Enum.min([2*l + 2*w, 2*w + 2*h, 2*h + 2*l])
  end
end
