defmodule ElixirPowerSet do
  def split_string_to_list(textToParse) do
    String.split(textToParse, ",", trim: true)
  end
end
