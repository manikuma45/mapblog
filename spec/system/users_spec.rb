require 'rails_helper'

RSpec.describe "users", type: :system do
  describe 'ログインページ' do
    before do
      visit new_user_session_path
    end
    context 'ゲストログインを押すと' do
      it 'ゲストログインができる' do
        click_link(I18n.t('Guest login'))
        expect(page).to have_content('guest')
      end
    end
  end
end
