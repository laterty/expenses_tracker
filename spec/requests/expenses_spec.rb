# frozen_string_literal: true

RSpec.describe 'Expenses' do
  describe 'GET /index' do
    context 'when user isnt signed in' do
      before { get '/expenses' }

      it { is_expected.to redirect_to(new_user_session_path) }

      it { expect(response).to have_http_status(:redirect) }
    end

    context 'when user signed in' do
      before do
        user = create(:user)
        sign_in user
        get '/expenses'
      end

      it { is_expected.to render_template('index') }

      it { expect(response).to have_http_status(:success) }
    end
  end

  describe 'GET /show' do
    let(:expense) { create(:expense) }

    before do
      sign_in expense.user
      get "/expenses/#{expense.id}"
    end

    it { is_expected.to render_template :show }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
