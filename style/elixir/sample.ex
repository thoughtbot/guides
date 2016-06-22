defmodule SampleStruct do
  defstruct [
              :attribute,
              :another_attribute,
              name: "Sample Struct"
            ]
end

defmodule Sample do
  def double(a) when is_binary(a) do
    a
    |> String.downcase
    |> String.duplicate(2)
  end
  def double(a) when is_integer(a)  do
    a * a
  end

  def indent_pipes_with_pattern_match do
    sanitized_string =
      some_string
      |> String.downcase
      |> String.strip
  end

  def pipes_without_pattern_match do
    some_string
    |> String.downcase
    |> String.strip
  end

  def pattern_matching_with_guard(number) when rem(number * 2) == 0 do
  end

  def use_with_and_a_tuple_when_possible do
    with {:ok, person} <- get_person(1),
         {:ok, confirmation} <- send_confirmation(person) do

      IO.puts "#{person.name} has been sent a confirmation."
    end
  end

end
