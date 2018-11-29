defmodule ElixirPowerSetTest do
  use ExUnit.Case

  describe "ElixirPowerSet unit tests" do
    test "Should return list [][a]" do
      assert [[], ["a"]] == ElixirPowerSet.powerset_for_string("a")
    end

    test "Should return list [][b]" do
      assert [[], ["b"]] == ElixirPowerSet.powerset_for_string("b")
    end
  end
end
