# frozen_string_literal: true

# frozen_string_literal = true

class ExpensesQuery < ApplicationQuery
  statinize do
    attribute :value, :amount, :sort, :created_at, :category_id
    attribute :base_scope, default_exec: -> { Expense.all }
  end

  def query
    scope = base_scope
    scope = filtered_scope(scope)
    sorted_scope(scope)
  end

  private

  def filtered_scope(scope)
    Expenses::FilterQuery.query(expenses: scope, value:, amount:, category_id:, created_at:)
  end

  def sorted_scope(scope)
    Expenses::SortQuery.query(expenses: scope, sort:)
  end
end
