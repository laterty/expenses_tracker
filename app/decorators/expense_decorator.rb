# frozen_string_literal: true

class ExpenseDecorator < Draper::Decorator
  delegate_all
  SHORT_DESCRIPTION_LENGTH = 20

  def short_description
    description.truncate(SHORT_DESCRIPTION_LENGTH)
  end
end
