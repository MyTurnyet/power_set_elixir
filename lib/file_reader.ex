defmodule FileReader do
  def read_file(path) do
    path
    |> Path.expand()
    |> Path.absname()
    |> File.read()
  end
end
