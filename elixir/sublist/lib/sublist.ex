defmodule Sublist do
  def bar do
    "bar"
  end

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []), do: :equal
  def compare([], [a]), do: :sublist
  def compare([a], []), do: :superlist
  def compare([a], [b]) do
    # IO.puts "got "
    # IO.inspect a
    # IO.inspect b
    if a == b do
      :equal
    else
      :unequal
    end
  end
  def compare(a, b) do
    # IO.puts "GOT compare with"
    # IO.inspect a
    # IO.inspect b

    x = Enum.count(a)
    y = Enum.count(b)
    cond do
      x > y && is_superlist?(a,b) -> :superlist
      y > x && is_superlist?(b,a) -> :sublist
      a == b ->
        :equal
      a != b ->
        :unequal
    end
  end

  defp is_superlist?(a,b) do
    legit_stats = [:equal, :superlist]
    IO.puts "is_superlist?"
    IO.inspect a
    IO.inspect Enum.take(a, Enum.count(a) - 1)

    cond do
      Enum.member?(legit_stats, compare(tl(a), b)) ->
        true
      Enum.member?(legit_stats, compare(Enum.take(a, Enum.count(a) - 1), b)) ->
        true
      true ->
        false
    end
  end
end
