handle_open = fn
  {:ok, file} -> "First line: #{IO.read(file, :line)}"
  {_, error} -> "Error:  #{:file.format_error(error)}"
end

# call with a file that exists
IO.puts(handle_open.(File.open("../.iex.exs")))
# and then with one that doesn't
IO.puts(handle_open.(File.open("nonexistent")))

# Exercise: Functions-2
# Write a function that takes three arguments. If the first two are zero, return "FizzBuzz."
# If the first is zero, return "Fizz." If the second is zero, return "Buzz."
# Otherwise return the third argument.
# Do not use any language features that we haven't yet covered in this book.

func = fn
  0, 0, _ -> IO.puts("FizzBuzz")
  0, _, _ -> IO.puts("Fizz")
  _, 0, _ -> IO.puts("Buzz")
  _, _, third -> IO.puts(third)
end

func.(0, 0, "foobar")
func.(0, "foo", "bar")
func.("foo", 0, "bar")
func.("foo", "bar", "foobar")

# Exercise: Functions-3
# The operator rem(a, b) returns the remainder after dividing a by b. Write a function that takes a single integer (n) and calls the function in the previous exercise, passing it rem(n,3), rem(n,5), and n. Call it seven times with the arguments 10, 11, 12, and so on. You should get “Buzz, 11, Fizz, 13, 14, FizzBuzz, 16.”

# (Yes, it’s a FizzBuzz solution with no conditional logic.)
