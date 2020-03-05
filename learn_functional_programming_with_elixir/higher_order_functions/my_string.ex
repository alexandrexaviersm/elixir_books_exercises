def capitalize_words(title) do
  title
  |> String.split()
  |> Enum.map(&String.capitalize/1)
  |> Enum.join(" ")
end

###################################

def capitalize_words(title) do
  title
  |> String.split()
  |> capitalize_all
  |> join_with_whitespace
end

def capitalize_all(words) do
  Enum.map(words, &String.capitalize/1)
end

def join_with_whitespace(words) do
  Enum.join(words, " ")
end
