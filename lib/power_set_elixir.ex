defmodule ElixirPowerSet do
  def split_string_to_list(textToParse) do
    String.split(textToParse, ",", trim: true)
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
  
end
