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

  describe 'Visitor forgots password' do
    before do
      visit new_user_session_path
      click_link(I18n.t('devise.sessions.new.forgot_password'))
      within '#new_user' do
        fill_in I18n.t('devise.passwords.new.email_placeholder'), with: user.email
        click_button(I18n.t('devise.passwords.new.submit_button'))
      end
    end

    it do
      expect(page).to have_current_path new_user_session_path, ignore_query: true
      expect(page).to have_content I18n.t('devise.passwords.send_instructions')
    end
  end
end
