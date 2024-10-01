defmodule Mix.Tasks.Advent.Generate.Day do
  use Igniter.Mix.Task

  @example "mix advent.generate.day --example arg"

  @shortdoc "A short description of your task"
  @moduledoc """
  #{@shortdoc}

  Longer explanation of your task

  ## Example

  ```bash
  #{@example}
  ```

  ## Options

  * [day] The day of the month to generate. Defaults to the current day in
  * [year] The year to generate. Defaults to the current year.
  """

  def info(_argv, _composing_task) do
    %Igniter.Mix.Task.Info{
      # dependencies to add
      adds_deps: [],
      # dependencies to add and call their associated installers, if they exist
      installs: [],
      # An example invocation
      example: @example,
      # Accept additional arguments that are not in your schema
      # Does not guarantee that, when composed, the only options you get are the ones you define
      extra_args?: false,
      # A list of environments that this should be installed in, only relevant if this is an installer.
      only: nil,
      # a list of positional arguments, i.e `[:file]`
      positional: [:day, :year],
      # Other tasks your task composes using `Igniter.compose_task`, passing in the CLI argv
      # This ensures your option schema includes options from nested tasks
      composes: [],
      # `OptionParser` schema
      schema: [],
      # CLI aliases
      aliases: []
    }
  end

  def igniter(igniter, argv) do
    # extract positional arguments according to `positional` above
    {arguments, _argv} = positional_args!(argv)

    day = advent_day(Map.get(arguments, :day))
    year = advent_year(Map.get(arguments, :year))

    full_day_number = String.pad_leading(to_string(day), 2, "0")
    day_module_name = Igniter.Code.Module.parse("Advent.Year#{year}.Day#{full_day_number}")
    test_module_name = Igniter.Code.Module.parse("Advent.Year#{year}.Day#{full_day_number}Test")

    # Do your work here and return an updated igniter
    igniter
    |> Igniter.Code.Module.create_module(day_module_name, """
      def part1(args) do
        args
      end

      def part2(args) do
        args
      end
    """)
    |> Igniter.Code.Module.create_module(test_module_name, """
      use ExUnit.Case

      import #{day_module_name}

      @tag :skip
      test "part1" do
        input = nil
        result = part1(input)

        assert result
      end

      @tag :skip
      test "part2" do
        input = nil
        result = part2(input)

        assert result
      end
    """,
    path: Igniter.Code.Module.proper_test_location(test_module_name))
  end

  defp advent_day(nil) do
    {:ok, now} = DateTime.now("America/New_York")
    now.day
  end

  defp advent_day(day) when is_binary(day) do
    case Integer.parse(day) do
      {day, _} when day in 1..24 ->
        day
      _ ->
        raise ArgumentError, "provide a valid day number from 1-25"
    end
  end

  defp advent_year(nil) do
    {:ok, now} = DateTime.now("America/New_York")
    now.year
  end

  defp advent_year(year) when is_binary(year) do
    case Integer.parse(year) do
      {year, _} ->
        year
      _ ->
        raise ArgumentError, "provide a valid year"
    end
  end
end
