#########################
# Bounded Recursion
# body-recursive
defmodule Factorial do
  def of(0), do: 1
  def of(n) when n > 0, do: n * of(n - 1)
end

# tail-recursive
defmodule TRFactorial do
  def of(n), do: factorial_of(n, 1)
  defp factorial_of(0, acc), do: acc
  defp factorial_of(n, acc) when n > 0, do: factorial_of(n - 1, n * acc)
end

#########################
# Unbounded Recursion
defmodule Navigator do
  def navigate(dir) do
    expanded_dir = Path.expand(dir)
    go_through([expanded_dir])
  end

  defp go_through([]), do: nil

  defp go_through([content | rest]) do
    print_and_navigate(content, File.dir?(content))
    go_through(rest)
  end

  defp print_and_navigate(_dir, false), do: nil

  defp print_and_navigate(dir, true) do
    IO.puts(dir)
    children_dirs = File.ls!(dir)
    go_through(expand_dirs(children_dirs, dir))
  end

  defp expand_dirs([], _relative_to), do: []

  defp expand_dirs([dir | dirs], relative_to) do
    expanded_dir = Path.expand(dir, relative_to)
    [expanded_dir | expand_dirs(dirs, relative_to)]
  end
end

# Adding Boundaries
defmodule DepthNavigator do
  @max_depth 2
  def navigate(dir) do
    expanded_dir = Path.expand(dir)
    go_through([expanded_dir], 0)
  end

  defp go_through([], _current_depth), do: nil

  defp go_through(_dirs, current_depth) when current_depth > @max_depth, do: nil

  defp go_through([content | rest], current_depth) do
    print_and_navigate(content, dir?(content), current_depth)
    go_through(rest, current_depth)
  end

  defp print_and_navigate(_dir, false, _current_depth), do: nil

  defp print_and_navigate(dir, true, current_depth) do
    IO.puts(dir)
    children_dirs = File.ls!(dir)
    go_through(expand_dirs(children_dirs, dir), current_depth + 1)
  end

  defp expand_dirs([], _relative_to), do: []

  defp expand_dirs([dir | dirs], relative_to) do
    expanded_dir = Path.expand(dir, relative_to)
    [expanded_dir | expand_dirs(dirs, relative_to)]
  end

  # Avoiding Infinite Loops - check if the dir isn't a symbolic link
  defp dir?(dir) do
    {:ok, %{type: type}} = File.lstat(dir)
    type == :directory
  end
end
