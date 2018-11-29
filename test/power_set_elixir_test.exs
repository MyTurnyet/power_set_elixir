defmodule ElixirPowerSetTest do
  use ExUnit.Case

  describe "ElixirPowerSet unit tests" do
    test "Should split string to list" do
      assert ["a", "b"] == ElixirPowerSet.split_string_to_list("a,b")
    end

    test "Should Return output as formatted string" do
      expectedOutput = "{},{a}"
      assert expectedOutput == ElixirPowerSet.format_list_as_string([[], ["a"]])
    end
  end
end
