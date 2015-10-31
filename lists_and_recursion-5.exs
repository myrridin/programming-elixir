defmodule MyEnum do

  def all?(list, func) do
    _all?(list, func, true)
  end

  defp _all?([], _, true), do: true
  defp _all?(_, _, false), do: false
  defp _all?([head | tail], func, true), do: _all?(tail, func, func.(head))

  def each([], func), do: true
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter(list, func) do
    _filter(list, func, [])
  end

  defp _filter([], _, new_list), do: new_list
  defp _filter([head | tail], func, new_list) do
    if func.(head) do
      _filter(tail, func, [head | new_list])
    else
      _filter(tail, func, new_list)
    end
  end

  def split(_, pos) when pos <= 0, do: raise "position must be greater than 0"
  def split(list, pos) do
    _split(list, pos, [], 0)
  end

  def _split([], _, other_list, _), do: {[], reverse(other_list)}
  def _split(list, pos, other_list, pos), do: {reverse(other_list), list}
  def _split([head | tail], pos, other_list, current_pos) do
    _split(tail, pos, [head | other_list], current_pos + 1)
  end

  def take(_, num) when num <= 0, do: raise "number must be greater than 0"
  def take(list, num) do
    _take(list, num, [], 0)
  end

  def _take(_, num, kept, num), do: reverse(kept)
  def _take([], _, kept, _), do: reverse(kept)
  def _take([head | tail], num, kept, current_pos), do: _take(tail, num, [head | kept], current_pos + 1)


  def reverse(list) do
    _reverse(list, [])
  end

  defp _reverse([], reversed_list), do: reversed_list
  defp _reverse([head | tail], reversed_list), do: _reverse(tail, [head | reversed_list])

end

IO.puts "----------------------------------------------------------------"
IO.puts "all? for [1, 2, 3] >= 2: #{MyEnum.all?([1,2,3], &(&1 >= 2))}"
IO.puts "all? for [1, 2, 3] < 4: #{MyEnum.all?([1,2,3], &(&1 < 4))}"

IO.puts "----------------------------------------------------------------"
IO.puts "each for [1, 2, 3] and IO.puts:"
MyEnum.each([1,2,3], &IO.puts/1)

IO.puts "----------------------------------------------------------------"
IO.puts "filter for [0, 1, 2, 3] >= 2:"
IO.inspect MyEnum.filter([0,1,2,3], &(&1 >= 2))
IO.puts "filter for [0, 1, 2, 3] < 4:"
IO.inspect MyEnum.filter([0,1,2,3], &(&1 < 4))
IO.puts "filter for [0, 1, 2, 3] > 4:"
IO.inspect MyEnum.filter([0,1,2,3], &(&1 > 4))

IO.puts "----------------------------------------------------------------"
IO.puts "split for [0, 1, 2, 3] at 2:"
IO.inspect MyEnum.split([0,1,2,3], 2)
IO.puts "split for [0, 1, 2, 3] at 5:"
IO.inspect MyEnum.split([0,1,2,3], 5)

IO.puts "----------------------------------------------------------------"
IO.puts "take for [0, 1, 2, 3] at 2:"
IO.inspect MyEnum.take([0,1,2,3], 2)
IO.puts "take for [0, 1, 2, 3] at 5:"
IO.inspect MyEnum.take([0,1,2,3], 5)
