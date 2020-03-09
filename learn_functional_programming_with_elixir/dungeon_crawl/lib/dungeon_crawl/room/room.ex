defmodule DungeonCrawl.Room do
  import DungeonCrawl.Room.Action
  defstruct description: nil, actions: []

  def all,
    do: [
      %__MODULE__{
        description: "You found a quiet place. Looks safe for a little nap.",
        actions: [forward(), rest()]
      }
    ]
end
