defmodule MyList do

  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)

end

IO.puts "Sum of empty list: #{MyList.sum([])}"
IO.puts "Sum of [1, 2, 3, 4, 5]: #{MyList.sum([1, 2, 3, 4, 5])}"
