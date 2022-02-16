require 'rails_helper'

RSpec.describe 'user index page', type: :feature do
  before(:each) do
    User.create! name: 'user1', email: 'user1@example.com', password: 'password', confirmed_at: Time.now
    User.create! name: 'user2', email: 'user2@example.com', password: 'password', confirmed_at: Time.now
    User.first.posts.create! title: 'Lorem ipsum', text: 'Lorem ipsum dolor sit amet'
    visit user_session_path
    fill_in 'Email', with: 'user1@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
  end

  it 'I can see the username of all other users' do
    expect(page).to have_content 'user1'
    expect(page).to have_content 'user2'
  end

  it 'I can see the profile picture for each user' do
    expect(page).to have_css 'img', count: 2
  end

  it 'I can see the number of posts each user has written' do
    expect(page).to have_content '0 Posts'
    expect(page).to have_content '1 Post'
  end
end
