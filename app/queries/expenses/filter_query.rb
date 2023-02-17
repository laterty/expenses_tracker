# frozen_string_literal: true

module Expenses
  class FilterQuery < ApplicationQuery
    statinize do
      attribute :value, :amount, :category, :created_at
      attribute :expenses, default_exec: -> { Expenses.all }
    end

    def query
      scope = expenses
      scope = scope.where(category:) if category
      scope = scope.where(amount:) if amount
      scope = scope.where(value:) if value
      scope = scope.where(created_at_params) if created_at
      scope
    end

    private

    def created_at_params
      start_time = created_at[:start]&.to_time&.to_i&.in_milliseconds
      end_time = created_at[:end]&.to_time&.to_i&.in_milliseconds
      { created_at: start_time..end_time }
    end
  end
end
