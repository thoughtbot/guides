defmodule Sample do
  use Sample.Web, :controller

  import Thing

  alias MyApp.Post
  alias MyApp.User

  def double(a) when is_binary(a) do
    a
    |> String.downcase
    |> String.duplicate(2)
  end
  def double(a) when is_integer(a)  do
    a * a
  end
end
