# 1 => Write two recursive functions: one that finds the biggest element of a list
# and another that finds the smallest. You should use them like this:

# My resolution
defmodule MyList do
  def max([]), do: 0

  def max([head | tail]) do
    biggest_element =
      if head > max(tail) do
        head
      else
        max(tail)
      end

    biggest_element
  end

  def min([]), do: nil

  def min([head | tail]) do
    smallest_element =
      if head < min(tail) do
        head
      else
        min(tail)
      end

    smallest_element
  end
end

# Book resolution
defmodule MyList do
  def max([]), do: nil
  def max([a]), do: a
  def max([a, b | rest]) when a >= b, do: find_max(rest, a)
  def max([a, b | rest]) when a < b, do: find_max(rest, b)

  defp find_max([], max), do: max
  defp find_max([head | rest], max) when head >= max, do: find_max(rest, head)
  defp find_max([head | rest], max) when head < max, do: find_max(rest, max)

  def min([]), do: nil
  def min([a]), do: a
  def min([a, b | rest]) when a <= b, do: find_min(rest, a)
  def min([a, b | rest]) when a > b, do: find_min(rest, b)

  defp find_min([], min), do: min
  defp find_min([head | rest], min) when head <= min, do: find_min(rest, head)
  defp find_min([head | rest], min) when head > min, do: find_min(rest, min)
end

# 2 => In the section Transforming Lists, on page 62, we traveled to a fantasy
# world and enchanted some items. Create a new module called GeneralStore
# where you can create a function that filters based on whether the products
# are magical. You can use the same test data from EnchanterShop :

defmodule GeneralStore do
  def test_data do
    [
      %{title: "Longsword", price: 50, magic: false},
      %{title: "Healing Potion", price: 60, magic: true},
      %{title: "Rope", price: 10, magic: false},
      %{title: "Dragon's Spear", price: 100, magic: true}
    ]
  end

  def filter_items([], magic: magic), do: []

  def filter_items([item = %{magic: item_magic} | rest], magic: filter_magic)
      when item_magic == filter_magic do
    [item | filter_items(rest, magic: filter_magic)]
  end

  def filter_items([item | rest], magic: filter_magic) do
    filter_items(rest, magic: filter_magic)
  end
end

# 3 => We’ve created a function that sorts the items of a list in ascending order.
# Now create a Sort.descending/1 function that sorts the elements in descending
# order.
defmodule Sort do
  def descending([]), do: []
  def descending([a]), do: [a]

  def descending(list) do
    half_size = div(Enum.count(list), 2)
    {list_a, list_b} = Enum.split(list, half_size)

    merge(
      descending(list_a),
      descending(list_b)
    )
  end

  defp merge([], list_b), do: list_b
  defp merge(list_a, []), do: list_a

  defp merge([head_a | tail_a], list_b = [head_b | _]) when head_a >= head_b do
    [head_a | merge(tail_a, list_b)]
  end

  defp merge(list_a = [head_a | _], [head_b | tail_b]) when head_a < head_b do
    [head_b | merge(list_a, tail_b)]
  end

  # tail-recursive Sort.merge
  defmodule SortMerge do
    def ascending([]), do: []
    def ascending([a]), do: [a]

    def ascending(list) do
      half_size = div(Enum.count(list), 2)
      {list_a, list_b} = Enum.split(list, half_size)

      merge(
        ascending(list_a),
        ascending(list_b),
        []
      )
    end

    defp merge([], list_b, merged), do: merged ++ list_b
    defp merge(list_a, [], merged), do: merged ++ list_a

    defp merge([head_a | tail_a], list_b = [head_b | _], merged)
         when head_a <= head_b do
      merge(tail_a, list_b, merged ++ [head_a])
    end

    defp merge(list_a = [head_a | _], [head_b | tail_b], merged)
         when head_a > head_b do
      merge(list_a, tail_b, merged ++ [head_b])
    end
  end
end

# 4 => We’ve written a lot of recursive functions, but not all of them are tail
# recursive. Write the tail-recursive versions of Sum.up_to/1 and Math.sum/1 .
# Extra challenge: write the tail-recursive version of Sort.merge/2 .

defmodule Sum do
  # body-recursive
  def up_to(0), do: 0
  def up_to(n), do: n + up_to(n - 1)

  # tail-recursive
  def up_to(n), do: sum_up_to(n, 0)
  defp sum_up_to(0, sum), do: sum
  defp sum_up_to(n, sum), do: sum_up_to(n - 1, n + sum)
end

defmodule Math do
  # body-recursive
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)

  # tail-recursive
  def sum(list), do: sum_list(list, 0)
  defp sum_list([], sum), do: sum
  defp sum_list([head | tail], sum), do: sum_list(tail, head + sum)
end

# 5 => In the section Adding Boundaries, on page 75, we added a depth restriction
# to limit how many directories deep our module should dive. Now create
# a BreadthNavigator module that has a breadth constraint; it will be the
# maximum number of sibling directories it can navigate.

defmodule Navigator do
  @max_breadth 2
  def navigate(dir) do
    expanded_dir = Path.expand(dir)
    go_through([expanded_dir], 0)
  end

  defp go_through([], current_breadth), do: nil

  defp go_through(list, current_breadth) when current_breadth > @max_breadth,
    do: nil

  defp go_through([content | rest], current_breadth) do
    print_and_navigate(content, File.dir?(content))
    go_through(rest, current_breadth + 1)
  end

  defp print_and_navigate(_dir, false), do: nil

  defp print_and_navigate(dir, true) do
    IO.puts(dir)
    {:ok, children_dirs} = File.ls(dir)
    go_through(expand_dirs(children_dirs, dir), 0)
  end

  defp expand_dirs([], _relative_to), do: []

  defp expand_dirs([dir | dirs], relative_to) do
    expanded_dir = Path.expand(dir, relative_to)
    [expanded_dir | expand_dirs(dirs, relative_to)]
  end
end
