defmodule MyList do

  def span(from, to) when from > to, do: raise "from must be less than or equal to to"
  def span(from, to), do: _span([], from, to)
  defp _span(list, from, from), do: [from | list]
  defp _span(list, from, current), do: _span([current | list], from, current-1)

end

IO.puts "List from 3 to 5 #{inspect MyList.span(3, 5), char_lists: false}"
IO.puts "List from 1 to 100 #{inspect MyList.span(1, 100), char_lists: false}"
IO.puts "List from -10 to 10 #{inspect MyList.span(-10, 10), char_lists: false}"
IO.puts "List from 5 to 5 #{inspect MyList.span(5, 5), char_lists: false}"
# IO.puts "List from 5 to 3 #{MyList.span(5, 3)}"
