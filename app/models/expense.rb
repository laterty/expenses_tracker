# frozen_string_literal: true

class Expense < ApplicationRecord
  MIN_VALUE = 0

  belongs_to :user
  belongs_to :category

  validates :value, presence: true, numericality: { greater_than: MIN_VALUE }
end
