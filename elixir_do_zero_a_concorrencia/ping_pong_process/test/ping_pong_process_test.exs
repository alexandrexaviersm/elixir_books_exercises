defmodule PingPongProcessTest do
  use ExUnit.Case
  doctest PingPongProcess

  test "greets the world" do
    assert PingPongProcess.hello() == :world
  end
end
