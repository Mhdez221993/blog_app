require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before(:each) do
    User.create! name: 'Hdez', email: 'hdez@gmail.com', password: '1234567', confirmed_at: Time.now
    User.create! name: 'Doe', email: 'doe@gmail.com', password: '1234567', confirmed_at: Time.now
    subjec = User.first
    subjec.posts.create! title: 'Lord', text: 'The lord of the ring'
    subjec.posts.create! title: 'Lord', text: 'The lord of the ring'

    visit user_session_path
    fill_in 'Email', with: 'hdez@gmail.com'
    fill_in 'Password', with: '1234567'
    click_on 'Log in'
  end

  it "I can see the user's profile picture." do
    expect(page).to have_css('img', count: 2)
  end

  it "I can see the user's username." do
    expect(page).to have_content('Hdez')
    expect(page).to have_content('Doe')
  end

  it 'I can see the number of posts the user has written.' do
    expect(page).to have_content('0 Posts')
    expect(page).to have_content('2 Post')
  end
end
