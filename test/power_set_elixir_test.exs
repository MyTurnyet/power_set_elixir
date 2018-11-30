defmodule ElixirPowerSetTest do
  use ExUnit.Case
  import ElixirPowerSet

  describe "ElixirPowerSet unit tests" do
    test "Should split string to list" do
      assert ["a", "b"] == split_string_to_list("a,b")
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

    # test "Should Return output as formatted string from list a,b" do
    #   expected_output = "{},{a},{b},{a,b}"
    #   assert expected_output == format_list_as_string([[], ["a"], ["b"], ["a", "b"]])
    # end

    # test "Should sort list by letter, than size" do
    #   expected_list = [[], ["a"], ["b"], ["a", "b"]]
    #   assert expected_list == sort_list([["a"], [], ["a", "b"], ["b"]])
    # end

    # test "Should return sets for {a,b} from list[a,b]" do
    #   expected_output = [["a", "b"], ["a"], ["b"], []]
    #   assert expected_output == get_powersets(["a", "b"])
    # end

    # test "Should return string of powersets from list[a,b]" do
    #   expected_output = "{},{a},{b},{a,b}"
    #   assert expected_output == parse("a,b")
    # end
  end
end
