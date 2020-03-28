defmodule Exercises do
  def double(num), do: num * 2

  def quadruple(num), do: double(num) * 2

  # Write a function gcd(x,y) that finds the greatest common divisor between two nonnegative integers.
  # Algebraically, gcd(x,y) is x if y is zero; it’s gcd(y, rem(x,y)) otherwise.

  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end
