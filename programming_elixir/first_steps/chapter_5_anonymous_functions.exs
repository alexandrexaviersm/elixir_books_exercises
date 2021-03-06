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
# The operator rem(a, b) returns the remainder after dividing a by b.
# Write a function that takes a single integer (n) and calls the function in the previous exercise,
# passing it rem(n,3), rem(n,5), and n. Call it seven times with the arguments 10, 11, 12, and so on.
# You should get “Buzz, 11, Fizz, 13, 14, FizzBuzz, 16.”

# (Yes, it’s a FizzBuzz solution with no conditional logic.) -> http://wiki.c2.com/?FizzBuzzTest

func_2 = fn n -> func.(rem(n, 3), rem(n, 5), n) end
func_2.(10)
func_2.(11)
func_2.(12)
func_2.(13)
func_2.(14)
func_2.(15)
func_2.(16)

# Exercise: Functions-4
# Write a function prefix that takes a string. It should return a new
# function that takes a second string. When that second function is
# called, it will return a string containing the first string, a space,
# and the second string.   
# iex> mrs = prefix.("Mrs")  
# Function<erl_eval.6.82930912>  
# iex> mrs.("Smith")  
# "Mrs Smith"  
# iex> prefix.("Elixir").("Rocks")  
# "Elixir Rocks"

prefix = fn str1 ->
  fn str2 -> "#{IO.puts(str1)} #{IO.puts(str2)}" end
end

mrs = prefix.("Mrs")
mrs.("Smith")
prefix.("Elixir").("Rocks")
