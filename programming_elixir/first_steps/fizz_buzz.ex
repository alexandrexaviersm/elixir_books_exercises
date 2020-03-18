# The "Fizz-Buzz test" is an interview question designed to help
# filter out the 99.5% of programming job candidates who can't seem to program
# their way out of a wet paper bag. The text of the programming assignment is as follows:

# "Write a program that prints the numbers from 1 to 100.
# But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”.
# For numbers which are multiples of both three and five print “FizzBuzz”."
defmodule FizzBuzz do
  def start() do
    Enum.each(1..100, &fizz_buzz(&1))
  end

  def fizz_buzz(n) do
    cond do
      number_multiple_3?(n) && number_multiple_5?(n) -> IO.puts("FizzBuzz")
      number_multiple_3?(n) -> IO.puts("Fizz")
      number_multiple_5?(n) -> IO.puts("Buzz")
      true -> IO.puts(n)
    end
  end

  defp number_multiple_3?(n) do
    rem(n, 3) == 0
  end

  defp number_multiple_5?(n) do
    rem(n, 5) == 0
  end
end
