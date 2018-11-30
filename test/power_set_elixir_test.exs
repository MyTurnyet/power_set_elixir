defmodule ElixirPowerSetTest do
  use ExUnit.Case
  import ElixirPowerSet

  describe "ElixirPowerSet unit tests" do
    test "Should split string to list" do
      assert ["a", "b"] == split_string_to_list("a,b")
    end

    test "Should split string with newline to list" do
      assert ["a", "b"] == split_string_to_list("a,b\n")
    end

    test "Should map_list_item [a] to string" do
      expected_output = "{a}"
      assert expected_output == map_list_item(["a"])
    end

    test "Should map_list_item [a,b] to string" do
      expected_output = "{a,b}"
      assert expected_output == map_list_item(["a", "b"])
    end

    test "Should Return output as formatted string  from list a" do
      expected_output = "{},{a}"
      assert expected_output == format_list_as_string([[], ["a"]])
    end

    test "Should Return output as formatted string from list a,b" do
      expected_output = "{},{a},{b},{a,b}"
      assert expected_output == format_list_as_string([[], ["a"], ["b"], ["a", "b"]])
    end

    test "Should sort list by letter, than size" do
      expected_list = [[], ["a"], ["b"], ["a", "b"]]
      assert expected_list == sort_list([["a"], [], ["a", "b"], ["b"]])
    end

    test "Should return sets for {a,b} from list[a,b]" do
      expected_output = [["a", "b"], ["a"], ["b"], []]
      assert expected_output == get_powersets(["a", "b"])
    end

    test "Should return string of powersets from list[a,b]" do
      expected_output = "{},{a},{b},{a,b}"
      assert expected_output == parse({:ok, "a,b"})
    end

    test "Calling parse_args/1 without arguments should throw error" do
      output = ElixirPowerSet.parse_args([])
      assert output == {:error, "No file path was passed to the applicaion"}
    end

    test "Calling parse_args/1 with argument should return it" do
      output = ElixirPowerSet.parse_args(["input.txt"])
      assert output == "input.txt"
    end

    test "Calling main/1 without arguments should throw error" do
      output = ElixirPowerSet.main()
      assert output == "No file path was passed to the applicaion"
    end
  end

  describe "ElixirPowerSet functional" do
    test "Calling Start with a path should produce error" do
      output = ElixirPowerSet.main(["test/input-powerset.txt"])

      assert output ==
               "File Not Found: /mnt/d/Development/power_set_elixir/test/input-powerset.txt"
    end

    test "Calling Start with a path should produce the powerset" do
      output = ElixirPowerSet.main(["test/powerset-input.txt"])

      assert output ==
               "{},{a},{b},{c},{d},{e},{a,b},{a,c},{a,d},{a,e},{b,c},{b,d},{b,e},{c,d},{c,e},{d,e},{a,b,c},{a,b,d},{a,b,e},{a,c,d},{a,c,e},{a,d,e},{b,c,d},{b,c,e},{b,d,e},{c,d,e},{a,b,c,d},{a,b,c,e},{a,b,d,e},{a,c,d,e},{b,c,d,e},{a,b,c,d,e}"
    end
  end
end
