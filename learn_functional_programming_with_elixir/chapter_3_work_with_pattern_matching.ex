defmodule Chapter3WorkWithPatternMatching do
  # In RPGs, players have points to spend on their character attributes. Create
  # a function that returns the total number of points players have spent on
  # their characters. The function will receive a map containing the strength,
  # dexterity, and intelligence values. Each point in strength should be multi-
  # plied by two, and dexterity and intelligence should be multiplied by three.

  def calculate_exercise_1(%{strength: str, dexterity: dex, intelligence: int}) do
    str * 2 + dex * 3 + int * 3
  end

  # Create a function that returns Tic-Tac-Toe game winners. You can repre-
  # sent the board with a tuple of nine elements, where each group of three
  # items is a row. The return of the function should be a tuple. When we
  # have a winner, the first element should be the atom :winner , and the second
  # should be the player. When we have no winner, the tuple should contain
  # one item that is the atom :no_winner . It should work like this:
  # TicTacToe.winner({
  # :x, :o, :x,
  # :o, :x, :o,
  # :o, :o, :x
  # })
  # # {:winner, :x}

  # TicTacToe.winner({
  # :x, :o, :x,
  # :o, :x, :o,
  # :o, :x, :o
  # })
  # # :no_winner

  def winner({
        x,
        x,
        x,
        _,
        _,
        _,
        _,
        _,
        _
      }),
      do: {:winner, x}

  def winner({
        _,
        _,
        _,
        x,
        x,
        x,
        _,
        _,
        _
      }),
      do: {:winner, x}

  def winner({
        _,
        _,
        _,
        _,
        _,
        _,
        x,
        x,
        x
      }),
      do: {:winner, x}

  def winner({
        x,
        _,
        _,
        x,
        _,
        _,
        x,
        _,
        _
      }),
      do: {:winner, x}

  def winner({
        _,
        x,
        _,
        _,
        x,
        _,
        _,
        x,
        _
      }),
      do: {:winner, x}

  def winner({
        _,
        _,
        x,
        _,
        _,
        x,
        _,
        _,
        x
      }),
      do: {:winner, x}

  def winner({
        x,
        _,
        _,
        _,
        x,
        _,
        _,
        _,
        x
      }),
      do: {:winner, x}

  def winner({
        _,
        _,
        x,
        _,
        x,
        _,
        x,
        _,
        _
      }),
      do: {:winner, x}

  def winner(_board), do: :no_winner

  # Create a function that calculates income tax following these rules: a salary
  # equal or below $2,000 pays no tax; below or equal to $3,000 pays 5%; below
  # or equal to $6,000 pays 10%; everything higher than $6,000 pays 15%.

  def income_tax(salary) when salary <= 2000, do: 0

  def income_tax(salary) when salary <= 3000, do: salary * 0.05

  def income_tax(salary) when salary <= 6000, do: salary * 0.1

  def income_tax(salary), do: salary * 0.15

  # Create an Elixir script where users can type their salary and see the
  # income tax and the net wage. You can use the module from the previous
  # exercise, but this script should parse the user input and display a message
  # when users type something that is not a valid number.
  def income_tax_net_wage() do
    input = IO.gets("Type your salary: \n")

    case Float.parse(input) do
      {salary, _} ->
        tax = income_tax(salary)
        IO.puts("Net wage: #{salary - tax} - Income tax: #{tax}")

      :error ->
        IO.puts("Invalid input")
    end
  end
end
