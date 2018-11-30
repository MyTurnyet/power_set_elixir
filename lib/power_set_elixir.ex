defmodule ElixirPowerSet do
  def split_string_to_list(text_to_parse) do
    String.split(text_to_parse, ",", trim: true)
  end

  def format_list_as_string(list_to_format) do
    Enum.map(
      list_to_format,
      fn list -> "{#{list}}" end
    )
    |> Enum.join(",")
  end

  def sort_list(list_to_sort) do
    list_to_sort
    |> Enum.sort()
    |> Enum.sort_by(&length/1)
  end

  def get_powersets([]) do
    [[]]
  end

  def get_powersets([head | tail]) do
    IO.inspect head
    output_list = get_powersets(tail)

    for letter <- output_list do
      [head | letter]
    end ++ output_list
  end
end
