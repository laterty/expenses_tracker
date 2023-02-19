# frozen_string_literal: true

RSpec.describe 'Log in' do
  let(:user) { create(:user) }

  describe 'Visitor logins successfully via log in form' do
    before do
      log_in(user)
    end

    it do
      expect(page).to have_current_path root_path, ignore_query: true
      expect(page).to have_content I18n.t('devise.sessions.signed_in')
    end
  end
end
