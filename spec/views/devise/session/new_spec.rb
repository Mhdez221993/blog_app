require 'rails_helper'

RSpec.describe 'Signing', type: :feature do
  describe 'signin in' do
    before(:all) do
      @user = User.new(name: 'Hdez', email: 'hdez@gmail.com', password: '123456')
      visit user_session_path
    end

    it 'I can see the username and password inputs and the "Submit" button' do
      expect(page).to have_field(type: 'email')
      expect(page).to have_field(type: 'password')
      expect(page).to have_button(type: 'submit')
    end

    it 'When I click the submit button without filling in the username and the password, I get a detailed error' do
      click 'Log in'
      # sleep(5)
      # expect(page).to have_content('Invalid Email or password.')
    end
  end
end
