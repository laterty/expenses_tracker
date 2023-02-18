# frozen_string_literal: true

class ExpenseSharing < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
end
