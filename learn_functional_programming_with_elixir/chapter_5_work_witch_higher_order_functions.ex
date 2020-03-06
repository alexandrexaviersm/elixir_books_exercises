# • In Chapter 4, Diving into Recursion, on page 59, we built a module called
# EnchanterShop that transforms mundane items into magical items for sale.
# Build this module again, but now apply the higher-order functions that
# you learned in this chapter.

defmodule EnchanterShop do
  @enchanter_name "Edwin"
  def test_data do
    [
      %{title: "Longsword", price: 50, magic: false},
      %{title: "Healing Potion", price: 60, magic: true},
      %{title: "Rope", price: 10, magic: false},
      %{title: "Dragon's Spear", price: 100, magic: true}
    ]
  end

  def enchant_for_sale(list) do
    Enum.map(list, &enchant/1)
  end

  def enchant(item = %{magic: true}), do: item

  def enchant(item) do
    %{
      title: "#{@enchanter_name}'s #{item.title}",
      price: item.price * 3,
      magic: true
    }
  end
end

# • In this chapter, we created a screw factory that processes metal pieces
# and generates screws. A new requirement has arrived for us: we now need
# to pack them. We can pack 30 screws per package, and it takes 70ms. A screw
# is packed when the resulting string is "|o---|" . Change the ScrewsFactory
# module, adding the simulation of packing screws.

defmodule ScrewsFactoryChunk do
  # metal_pieces = Enum.take(Stream.cycle(["-"]), 1000)
  def run(pieces) do
    pieces
    |> Stream.chunk(50)
    |> Stream.flat_map(&add_thread/1)
    |> Stream.chunk(100)
    |> Stream.flat_map(&add_head/1)
    |> Stream.chunk(30)
    |> Stream.flat_map(&add_pack/1)
    |> Enum.each(&output/1)
  end

  defp add_thread(pieces) do
    Process.sleep(50)
    Enum.map(pieces, &(&1 <> "--"))
  end

  defp add_head(pieces) do
    Process.sleep(100)
    Enum.map(pieces, &("o" <> &1))
  end

  defp add_pack(pieces) do
    Process.sleep(70)
    Enum.map(pieces, &("|" <> &1 <> "|"))
  end

  defp output(screw) do
    IO.inspect(screw)
  end
end

# • Create a function that generates the Fibonacci sequence up to a given
# quantity. Use streams to produce it. You’ll need to take a look at the
# Stream.unfold/2 function. Tip: Try to make the recursive version first.
defmodule Fibonacci do
  # def fib(0), do: 0
  # def fib(1), do: 1

  # def fib(n) do
  #  fib(n - 1) + fib(n - 2)
  # end

  def sequence(n) do
    Stream.unfold({0, 1}, fn {n1, n2} -> {n1, {n2, n1 + n2}} end)
    |> Enum.take(n)
  end
end

# • Implement the Quicksort algorithm. Tip: You can use the first item of
# the list to be the pivot, and employ the Enum.split_with/2 higher-order function.

defmodule Quicksort do
  def quicksort([]), do: []

  def quicksort(list = [pivot | tail]) do
    {lesser, greater} = Enum.split_with(tail, &(&1 <= pivot))
    quicksort(lesser) ++ [pivot] ++ quicksort(greater)
  end
end
