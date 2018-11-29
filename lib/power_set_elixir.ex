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
end
