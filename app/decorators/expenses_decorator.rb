# frozen_string_literal: true

class ExpensesDecorator < Draper::CollectionDecorator
  def sum_value
    sum(&:value)
  end
end
