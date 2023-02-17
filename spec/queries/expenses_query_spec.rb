# frozen_string_literal: true

RSpec.describe ExpensesQuery do
  subject(:query_result) { described_class.query(params) }

  let!(:categories) { create_list(:category, 2) }

  context 'expenses' do
    context 'sorting only' do
      let!(:expense1) { create(:expense, created_at: Time.zone.now) }
      let!(:expense2) { create(:expense, created_at: 2.minutes.ago) }
      let!(:expense3) { create(:expense, created_at: 5.minutes.ago) }

      context 'when empty params' do
        let(:params) { {} }

        it 'sorts by default sort type (created_at desc)' do
          expect(query_result).to eq([expense1, expense2, expense3])
        end
      end

      context 'when sort params' do
        let(:params) { { sort: 'created_at_asc' } }

        it 'sorts by created_at asc' do
          expect(query_result).to eq([expense3, expense2, expense1])
        end
      end
    end

    context 'filtering only' do
      context 'by category' do
        let(:expense1) { create(:expense, category: categories[0]) }
        let(:expense2) { create(:expense, category: categories[1]) }
        let(:expense3) { create(:expense, category: categories[0]) }

        context 'when filter second category' do
          let(:params) { { category_id: categories[1].id } }

          it 'returns expenses only with second category' do
            expect(query_result).to match_array([expense2])
          end
        end

        context 'when filter by first category' do
          let(:params) { { category_id: categories[0].id } }

          it 'returns expenses only with first category' do
            expect(query_result).to match_array([expense1, expense3])
          end
        end
      end
    end

    context 'sorting & filtering' do
      let!(:expense1) { create(:expense, created_at: Time.zone.now, category: categories[0]) }
      let!(:expense2) do
        create(:expense, created_at: 2.minutes.ago, category: categories[0])
      end
      let!(:expense3) do
        create(:expense, created_at: 5.minutes.ago, category: categories[1])
      end

      context 'filter by category first and sort by created_at asc' do
        let(:params) do
          { sort: 'created_at_asc', category_id: categories[0].id }
        end

        it 'sorts by created_at asc and filter by category first' do
          expect(query_result).to eq([expense2, expense1])
        end
      end

      context 'filter by category second and sort by created_at asc' do
        let(:params) do
          { sort: 'created_at_asc', category_id: categories[1].id }
        end

        it 'sorts by created_at asc and filter by category first' do
          expect(query_result).to eq([expense3])
        end
      end

      context 'filter by category first and sort by created_at desc' do
        let(:params) do
          { sort: 'created_at_desc', category_id: categories[0].id }
        end

        it 'sorts by created_at desc and filter by category first' do
          expect(query_result).to eq([expense1, expense2])
        end
      end
    end
  end
end
