defmodule ElixirPowerSetTest do
  use ExUnit.Case

  describe "ElixirPowerSet unit tests" do
    test "Should Return list as string" do
      assert [[], ["a"]] == ElixirPowerSet.powerset_for_string("a")
    end
  end
end
