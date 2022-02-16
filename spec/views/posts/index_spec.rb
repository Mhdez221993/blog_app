require 'rails_helper'

RSpec.describe 'user index page', type: :feature do
  before(:each) do
    @user = User.create! name: 'user1', bio: 'My bio',
                         email: 'user1@example.com',
                         password: 'password', confirmed_at: Time.now
    (1..4).each { |i| @user.posts.create! title: "Lorem ipsum#{i}", text: 'Lorem ipsum dolor sit amet' }
    visit user_session_path
    fill_in 'Email', with: 'user1@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    visit user_posts_path(@user)
  end

  it "I can see the user's profile picture" do
    expect(page).to have_css 'img', count: 1
  end
end
