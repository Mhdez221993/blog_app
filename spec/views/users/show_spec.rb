require 'rails_helper'

RSpec.describe "User show page", type: :feature do
  before(:each) do
    User.create! name: 'Doe', bio: 'Full-Stack Web Dev', email: 'doe@gmail.com', password: '1234567', confirmed_at: Time.now
    visit user_session_path
    fill_in 'Email', with: 'doe@gmail.com'
    fill_in 'Password', with: '1234567'
    click_on 'Log in'
    click_on 'Doe'
  end

  it "I can see the user's profile picture." do
    expect(page).to have_css('img', count: 1)
  end
end
