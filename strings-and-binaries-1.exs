defmodule MyString do
  def printable?(str) do
    Enum.all? str, &(&1 in (?\s..?~))
  end
end

ExUnit.start

defmodule MyStringTest do
  use ExUnit.Case, async: true

  test "It returns the proper value for each list" do
    tests = [ {[78, 79, 80], true},
      {[78, 79, 80], true},
      {[0], false},
      {[20, 40, 60], false},
      {'hello', true},
      {[32, 126], true},
      {[31], false},
      {[127], false} ]

    for {test_list, expected_output} <- tests do
      assert MyString.printable?(test_list) == expected_output
    end
  end
end

