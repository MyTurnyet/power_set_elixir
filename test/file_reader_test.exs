defmodule FileReaderTest do
  use ExUnit.Case
  import FileReader

  describe "FileReader unit tests" do
    test "Should return Error if file path doesn't exist" do
      file_path = "test/powerset_input.txt"


      assert {:error,
              "File Not Found: /mnt/d/Development/power_set_elixir/test/powerset_input.txt"} ==
               read_file(file_path)
    end

    test "Should return :ok if file path doesn't exist" do
      file_path = "test/powerset-input.txt"
      assert {:ok, input} = read_file(file_path)
      assert input == "a,b,c,d,e\n"
    end
  end
end
