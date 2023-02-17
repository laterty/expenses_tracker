# frozen_string_literal: true

module Expenses
  class SortQuery < ApplicationQuery
    CREATED_AT_ASC = 'created_at ASC'
    CREATED_AT_DESC = 'created_at DESC'
    VALUE_ASC = 'value ASC'
    VALUE_DESC = 'value DESC'

    ORDERS_TYPE = {
      created_at_asc: CREATED_AT_ASC,
      created_at_desc: CREATED_AT_DESC,
      value_asc: VALUE_ASC,
      value_desc: VALUE_DESC
    }.freeze

    DEFAULT_SORT_KEY = CREATED_AT_ASC

    statinize do
      before { @sort = generate_order(sort&.to_sym) }
      attribute :sort
      attribute :expenses, default_exec: -> { Expenses.all }
    end

    def query
      expenses.order(sort)
    end

    private

    def generate_order(sort)
      ORDERS_TYPE[sort] || DEFAULT_SORT_KEY
    end
  end
end
