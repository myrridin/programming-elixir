defmodule Tax do

  def calculate_for(tax_rates, orders) do
    for order <- orders, do: calculate(tax_rates, order)
  end

  defp calculate(tax_rates, order = [_, {:ship_to, state}, {:net_amount, amount}]) do
    tax_rate = 1.0 + Keyword.get(tax_rates, state, 0.0)
    order ++ [total_amount: Float.round(amount * tax_rate, 2)]
  end

end

ExUnit.start

defmodule TaxTest do
  use ExUnit.Case, async: true

  test "It calculates tax properly" do
    tax_rates = [ NC: 0.075, TX: 0.08 ]
    orders = [
      [ id: 123, ship_to: :NC, net_amount: 100.00 ],
      [ id: 124, ship_to: :OK, net_amount:  35.50 ],
      [ id: 125, ship_to: :TX, net_amount:  24.00 ],
      [ id: 126, ship_to: :TX, net_amount:  44.80 ],
      [ id: 127, ship_to: :NC, net_amount:  25.00 ],
      [ id: 128, ship_to: :MA, net_amount:  10.00 ],
      [ id: 129, ship_to: :CA, net_amount: 102.00 ],
      [ id: 130, ship_to: :NC, net_amount:  50.00 ] ]
    expected_output = [
      [ id: 123, ship_to: :NC, net_amount: 100.00, total_amount: 107.50 ],
      [ id: 124, ship_to: :OK, net_amount:  35.50, total_amount:  35.50 ],
      [ id: 125, ship_to: :TX, net_amount:  24.00, total_amount:  25.92 ],
      [ id: 126, ship_to: :TX, net_amount:  44.80, total_amount:  48.38 ],
      [ id: 127, ship_to: :NC, net_amount:  25.00, total_amount:  26.88 ],
      [ id: 128, ship_to: :MA, net_amount:  10.00, total_amount:  10.00 ],
      [ id: 129, ship_to: :CA, net_amount: 102.00, total_amount: 102.00 ],
      [ id: 130, ship_to: :NC, net_amount:  50.00, total_amount:  53.75 ] ]
    assert Tax.calculate_for(tax_rates, orders) == expected_output
  end
end

