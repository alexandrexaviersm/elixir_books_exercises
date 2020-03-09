defmodule DungeonCrawl.Room.Action do
  defstruct label: nil, id: nil
  def forward, do: %__MODULE__{id: :forward, label: "Move forward."}
  def rest, do: %__MODULE__{id: :rest, label: "Take a better look and rest."}
  def search, do: %__MODULE__{id: :search, label: "Search the room."}
end
