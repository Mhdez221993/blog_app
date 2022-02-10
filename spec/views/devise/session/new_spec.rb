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

    it 'When I click the submit button without filling in the username and the password, I get a detailed error' do
      visit user_session_path
      fill_in 'Email', with: 'hdez@gmail.com'
      fill_in 'Password', with: '1'
      click_on 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
  end
end
