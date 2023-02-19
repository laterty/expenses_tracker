# frozen_string_literal: true

RSpec.describe ExpensesDecorator do
  let(:expenses) { described_class.decorate(create_list(:expense, 4, value: 10)) }

  describe '#sum_value' do
    let(:sum_value) { expenses.sum_value }
    let(:expected_sum_value) { 40 }

    it 'return sum of value * amount' do
      expect(sum_value).to eq(expected_sum_value)
    end
  end
end
