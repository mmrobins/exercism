defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    case l do
      [] -> 0
      [head|tail] -> count_rec(tail, 1)
    end
  end

  defp count_rec(l, acc) do
    case l do
      [] -> acc
      [head|tail] -> count_rec(tail, acc + 1)
    end
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reverse_rec(l, [])
  end
  defp reverse_rec([], acc), do: acc
  defp reverse_rec([head | tail], acc) do
    reverse_rec(tail, [ head | acc ])
  end

  @spec map(list, (any -> any)) :: list
  def map([], f), do: []
  def map([head | tail], f) do
    [ f.(head) | map(tail, f) ]
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], f), do: []
  def filter([head | tail], f) do
    if f.(head) do
      [ head | filter(tail, f) ]
    else
      filter(tail, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, f), do: acc
  def reduce([head | tail], acc, f) do
    reduce(tail, f.(head, acc), f)
  end

  @spec append(list, list) :: list
  def append([], b), do: b
  def append(a, []), do: a
  def append([head | tail], b) do
    [ head | append(tail, b) ]
  end

  @spec concat([[any]]) :: [any]
  def concat(l) do
    concat_rec(l, [])

  end
  def concat_rec([], acc), do: acc
  defp concat([head | tail], acc), do: concat_rec(head, tail, acc)
  defp concat([], tail, acc), do: concat_rec(tail, acc)
end
