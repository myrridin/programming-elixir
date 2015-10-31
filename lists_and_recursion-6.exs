defmodule MyList do

  def flatten(list) do
    Enum.reverse(_flatten(list, []))
  end

  def _flatten([], flattened_list), do: flattened_list

  def _flatten([inner_list = [_ | _] | tail], flattened_list) do
    _flatten(tail, _flatten(inner_list, flattened_list))
  end

  def _flatten([head | tail], flattened_list) do
    _flatten(tail, [head | flattened_list])
  end

end

IO.puts "MyList.flatten for [ 1, [ 2, 3, [4] ], 5, [[[6]]]]:"
IO.inspect MyList.flatten([1,[2,3,[4]],5,[[[6]]]])
