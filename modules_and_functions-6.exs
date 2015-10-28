defmodule Chop do
  def guess(num, range) do
    check(num, best_guess(range), range)
  end

  def best_guess(range_start..range_end) do
    range_start + div(range_end-range_start, 2)
  end

  def check(num, num, _range) do
    IO.puts "GOT IT! Number was #{num}"
  end
  def check(num, answer, range_start.._range_end) when answer > num do
    IO.puts "Is it #{answer}? NOPE"
    check(num, best_guess(range_start..answer-1), range_start..answer-1)
  end
  def check(num, answer, _range_start..range_end) when answer < num do
    IO.puts "Is it #{answer}? NOPE"
    check(num, best_guess(answer+1..range_end), answer+1..range_end)
  end
end

Chop.guess(273, 1..1000)

