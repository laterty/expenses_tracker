# frozen_string_literal: true

class ExpensesDecorator < Draper::CollectionDecorator
  def sum_value
    sum { _1.value * _1.amount }
  end
end
