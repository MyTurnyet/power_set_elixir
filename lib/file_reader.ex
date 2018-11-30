defmodule FileReader do

  def read_file(path) do
    full_path =
      path
      |> Path.expand()
      |> Path.absname()

    full_path
    |> read(File.exists?(full_path))
  end

  defp read(path, file_exists) when file_exists == true do
    path
    |> File.read()
  end

  defp read(path, file_exists) when file_exists == false do
    {:error, "File Not Found: #{path}"}
  end
end
