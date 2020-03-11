defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room.Triggers
  import DungeonCrawl.Room.Action
  defstruct description: nil, actions: [], trigger: nil

  def all,
    do: [
      %__MODULE__{
        description: "You can see the light of day. You found the exit!",
        actions: [forward()],
        trigger: Triggers.Exit
      },
      %__MODULE__{
        description: "You can see an enemy blocking your path.",
        actions: [forward()],
        trigger: Triggers.Enemy
      },
      %__MODULE__{
        description: "You can see a calm and comfortable room.",
        actions: [forward(), rest()],
        trigger: Triggers.EnemyHidden
      },
      %__MODULE__{
        description: "You can see a calm and comfortable room.",
        actions: [forward(), rest()],
        trigger: Triggers.Rest
      },
      %__MODULE__{
        description: "You can see a dubious room.",
        actions: [forward(), search()],
        trigger: Triggers.Trap
      },
      %__MODULE__{
        description: "You can see a dubious room.",
        actions: [forward(), search()],
        trigger: Triggers.Treasure
      }
    ]
end
