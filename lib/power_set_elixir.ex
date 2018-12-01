defmodule ElixirPowerSet do
  alias FileReader

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

  def parse({:error, message}) do
    message
  end

  def parse({:ok, text_to_parse}) do
    text_to_parse
    |> split_string_to_list()
    |> calculate_and_sort()
  end

  def parse(list_to_parse) do
    list_to_parse
    |> calculate_and_sort()
  end

  defp calculate_and_sort(list_to_parse) do
    list_to_parse
    |> get_powersets()
    |> sort_list()
    |> format_list_as_string()
  end

  def main(args \\ []) do
    args
    |> parse_args
    |> read_file
    |> write_to_output
  end

  defp read_file({:error, message}) do
    message
  end

  defp read_file({[], file_path}) do
    file_path
    |> FileReader.read_file()
    |> parse()
  end

  defp read_file({options, base_set}) do
    if options[:inline] do
      base_set
      |> parse()
    else
      {:error, "That is an unknown argument"}
    end
  end

  defp write_to_output(message) do
    message
    |> IO.puts()
  end

  def parse_args([]) do
    {:error, "No file path was passed to the applicaion"}
  end

  def parse_args(args) do
    {option, base_set, _} =
      args
      |> OptionParser.parse(switches: [inline: :boolean])

    {option,
     base_set
     |> List.first()
     |> String.split(",", trim: true)}
  end
end
