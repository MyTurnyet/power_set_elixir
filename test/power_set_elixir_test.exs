defmodule ElixirPowerSetTest do
  use ExUnit.Case
  import ElixirPowerSet

  describe "ElixirPowerSet unit tests" do
    test "Should split string to list" do
      assert ["a", "b"] == split_string_to_list("a,b")
    end

    test "Should Return output as formatted string" do
      expectedOutput = "{},{a}"
      assert expectedOutput == format_list_as_string([[], ["a"]])
    end

    test "Should sort list by letter, than size" do
      expectedList = [[], ["a"], ["b"], ["a", "b"]]
      assert expectedList == sort_list([["a"], [], ["a", "b"], ["b"]])
    end

    
  end
end
