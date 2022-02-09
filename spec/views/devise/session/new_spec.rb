require 'rails_helper'

RSpec.describe 'Signing', type: :feature do
  describe 'signin in' do
    it 'Show the right content' do
      visit user_session_path
      sleep(5)
      expect(page).to have_content('Log in')
    end
  end
end
