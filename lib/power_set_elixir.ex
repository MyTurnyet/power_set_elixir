defmodule ElixirPowerSet do
  def split_string_to_list(text_to_parse) do
    text_to_parse
    |> String.replace_trailing("\n", "")
    |> String.split(",", trim: true)
  end

  def format_list_as_string([]) do
    "{},"
  end

  def format_list_as_string(list_to_convert) do
    for(
      list_item <- list_to_convert,
      do: map_list_item(list_item)
    )
    |> Enum.map(fn item -> item end)
    |> Enum.join(",")
  end

  def map_list_item(list_item) do
    item_as_string =
      Enum.map(
        list_item,
        fn item -> item end
      )
      |> Enum.join(",")

    "{#{item_as_string}}"
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
    output_list = get_powersets(tail)

    for letter <- output_list do
      [head | letter]
    end ++ output_list
  end

  def parse(test_to_parse) do
    test_to_parse
    |> split_string_to_list()
    |> get_powersets()
    |> sort_list()
    |> format_list_as_string()
  end
end
