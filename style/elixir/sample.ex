defmodule Sample do
  def double(a) when is_binary(a) do
    a
    |> String.downcase
    |> String.duplicate(2)
  end
  def double(a) when is_integer(a)  do
    a * a
  end
end
