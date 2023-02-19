# frozen_string_literal: true

RSpec.describe ExpenseDecorator do
  let(:expense) { create(:expense, description: FFaker::Lorem.characters(30)).decorate }

  describe '#short_description' do
    let(:truncate_description_length) { expense.short_description.length }
    let(:expected_description_length) { described_class::SHORT_DESCRIPTION_LENGTH }

    it 'return truncate descriptiom' do
      expect(truncate_description_length).to eq(expected_description_length)
    end
  end
end
