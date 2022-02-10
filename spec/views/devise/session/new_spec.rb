require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  describe 'signin in' do
    before(:each) do
      visit user_session_path
      User.create! name: 'chaw', password: '123456', email: 'hdez@gmail.com', confirmed_at: Time.now
    end

    it 'I can see the username and password inputs and the "Submit" button' do
      expect(page).to have_field(type: 'email')
      expect(page).to have_field(type: 'password')
      expect(page).to have_button(type: 'submit')
    end
  end
end
