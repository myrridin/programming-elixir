defmodule MyList do

  def mapsum([], _func), do: 0
  def mapsum([head | tail], func), do: func.(head) + mapsum(tail, func)

  def max(list), do: _max(list, 0)
  defp _max([], current_max), do: current_max
  defp _max([head | tail], current_max) when head > current_max, do: _max(tail, head)
  defp _max([head | tail], current_max) when head <= current_max, do: _max(tail, current_max)

  def caesar([], _rot), do: []
  def caesar([head | tail], rot) when head + rot > 122, do: caesar([head - 26 | tail], rot)
  def caesar([head | tail], rot), do: [head+rot | caesar(tail, rot)]
end

IO.puts "ListsAndRecursion-1"
IO.puts "mapsum for [1,2,3] with squaring function: #{MyList.mapsum([1,2,3], &(&1 * &1))}"
IO.puts ""

IO.puts "ListsAndRecursion-2"
IO.puts "Max value in [1,2,3]: #{MyList.max([1,2,3])}"
IO.puts "Max value in [-1,0,1]: #{MyList.max([-1,0,1])}"
IO.puts "MAX value in [\"cat\", :atomname, 42]: #{MyList.max(["cat", :atomname, 42])}"
IO.puts ""

IO.puts "ListsAndRecursion-3"
IO.puts "String caesar cipher for 'ryvkve', 13 (ROT-13):  #{MyList.caesar('ryvkve', 13)} :-)"
