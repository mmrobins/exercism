defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    String.split(sentence, "\s")
      |> Enum.map(fn(x) -> String.replace(x, ~r/^[^a-zA-Z\d]+/, "") end)
      |> Enum.map(fn(x) -> String.replace(x, ~r/[^a-zA-Z\d]+$/, "") end)
      |> Enum.flat_map(fn(x) -> String.split(x, "_") end)
      |> Enum.reject(fn(x) -> x == "" end)
      |> Enum.group_by(fn(x) -> String.downcase(x) end)
      |> Enum.map(fn(x) -> {a, b} = x; {a, Enum.count(b)} end) 
      |> Enum.into(%{})
  end
end
