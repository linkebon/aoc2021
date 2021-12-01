defmodule Combinator do
  def combine(input, len)
  def combine(_, 0), do: [[]]
  def combine([], _), do: []

  def combine([h | t], len),
      do: Enum.map(combine(t, len - 1), &[h | &1]) ++ combine(t, len)
end