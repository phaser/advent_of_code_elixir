# Advent of code in Elixir

This is a repository containing my solutions to various problems from the [Advent of Code](https://adventofcode.com/) site.

## Generate code for a new AOC day

```poowershell
mix advent.generate.day [day] [year]
```

This generates `day[day].ex` file in `lib/advent/year[year]` folder and `day[day]_test.exs` in `test/advent/year[year]` folder.
It also generates to mix tasks in `lib/mix/tasks` called `y[year].d[day].p1.ex` and `y[year].d[day].p2.ex` that can be used
to run the solution for part1 on the input.

The input is downloaded automatically if the session cookie is set in environment variable called `ADVENT_OF_CODE_SESSION_COOKIE`

```powershell
$env:ADVENT_OF_CODE_SESSION_COOKIE="session_cookie"
mix y2015.d01.p1
```
