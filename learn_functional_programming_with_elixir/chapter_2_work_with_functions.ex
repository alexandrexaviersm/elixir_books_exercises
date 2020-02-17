defmodule Chapter2WorkWithFunctions do
  # Create an expression that solves the following problem: Sarah has bought
  # ten slices of bread for ten cents each, three bottles of milk for two dollars
  # each, and a cake for fifteen dollars. How many dollars has Sarah spent?
  def calculate_exercise_1() do
    total_spend = 10 * 0.1 + 3 * 2 + 15
    IO.puts("Sarah has spent $#{total_spend}")
  end

  # Bob has traveled 200 km in four hours. Using variables, print a message
  # showing his travel distance, time, and average velocity.
  def calculate_exercise_2() do
    traveled_distance = 200
    time = 4
    average_velocity = traveled_distance / time

    IO.puts(
      "Bob has traveled #{traveled_distance}Km in #{time} hours at #{average_velocity} Km/h"
    )
  end

  # Build an anonymous function that applies a tax of 12% to a given price.
  # It should print a message with the new price and tax value. Bind the
  # anonymous function to a variable called apply_tax . You should use the
  # apply_tax with Enum.each/2 , like the example below.
  # Enum.each , apply_tax

  # Price: 14.0 - Tax: 1.5
  # Price: 34.7088 - Tax: 3.7188
  # Price: 280.5488 - Tax: 30.0588
  # Price: 21.056 - Tax: 2.256
  def calculate_exercise_3() do
    apply_tax = fn price ->
      tax = price * 0.12
      IO.puts("Price: #{price + tax} - Tax: #{tax}")
    end

    Enum.each([12.5, 30.99, 250.49, 18.80], apply_tax)
  end

  # Create a module called MatchstickFactory and a function called boxes/1 . The
  # function will calculate the number of boxes necessary to accommodate
  # some matchsticks. It will return a map with the number of boxes necessary
  # for each type of box. The factory has three types of boxes: the big ones
  # hold fifty matchsticks, the medium ones hold twenty, and the small ones
  # hold five. The boxes can’t have fewer matchstick that they can hold; they
  # must be full. The returning map should contain the remaining match-
  # sticks. It should work like this:
  # MatchstickFactory.boxes(98)
  # # %{big: 1, medium: 2, remaining_matchsticks: 3, small: 1}
  # MatchstickFactory.boxes(39)
  # # %{big: 0, medium: 1, remaining_matchsticks: 4, small: 3}
  # Tip: You’ll need to use the rem/2 and div/2 functions.

  defmodule MatchstickFactory do
    def boxes(matchsticks, state \\ %{big: 0, medium: 0, remaining_matchsticks: 0, small: 0}) do
      cond do
        matchsticks >= 50 ->
          big_box = div(matchsticks, 50)
          remaining_boxes = rem(matchsticks, 50)
          state = Map.put(state, :big, big_box)
          boxes(remaining_boxes, state)

        matchsticks >= 20 ->
          big_box = div(matchsticks, 20)
          remaining_boxes = rem(matchsticks, 20)
          state = Map.put(state, :medium, big_box)
          boxes(remaining_boxes, state)

        matchsticks >= 5 ->
          big_box = div(matchsticks, 5)
          remaining_boxes = rem(matchsticks, 5)
          state = Map.put(state, :small, big_box)
          boxes(remaining_boxes, state)

        matchsticks < 5 ->
          Map.put(state, :remaining_matchsticks, matchsticks)
      end
    end
  end

  defmodule MatchstickFactoryBook do
    @size_big 50
    @size_medium 20
    @size_small 5

    def boxes(matchsticks) do
      big_boxes = div(matchsticks, @size_big)
      remaining = rem(matchsticks, @size_big)

      medium_boxes = div(remaining, @size_medium)
      remaining = rem(remaining, @size_medium)

      small_boxes = div(remaining, @size_small)
      remaining = rem(remaining, @size_small)

      %{
        big: big_boxes,
        medium: medium_boxes,
        small: small_boxes,
        remaining_matchsticks: remaining
      }
    end
  end
end
