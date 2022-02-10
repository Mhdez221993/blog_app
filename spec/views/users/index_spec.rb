require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before(:each) do
    @subjec1 = User.create! name: 'Hdez', email: 'hdez@gmail.com', password: '1234567', confirmed_at: Time.now
    @subjec1 = User.create! name: 'Doe', email: 'doe@gmail.com', password: '1234567', confirmed_at: Time.now
    visit user_session_path
    fill_in 'Email', with: 'hdez@gmail.com'
    fill_in 'Password', with: '1234567'
    click_on 'Log in'
  end

  it "I can see the user's profile picture." do
    expect(page).to have_css('img', count: 2)
  end
end
