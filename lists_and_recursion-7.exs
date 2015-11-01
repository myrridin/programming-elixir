defmodule MyList do

  def span(from, to) when from > to, do: raise "from must be less than or equal to to"
  def span(from, to), do: _span([], from, to)
  defp _span(list, from, from), do: [from | list]
  defp _span(list, from, current), do: _span([current | list], from, current-1)

  def primes_up_to(max) do
    for n <- span(2, max), _is_prime?(n), do: n
  end

  defp _is_prime?(n) when n < 2, do: false
  defp _is_prime?(n) when n < 4, do: true
  defp _is_prime?(n) do
    max = :math.sqrt(n) |> Float.floor |> round
    Enum.all?(span(2, max), &(rem(n, &1) != 0))
  end
end

IO.puts "Prime numbers from 2 to 100_000"
IO.inspect MyList.primes_up_to(100_000)
