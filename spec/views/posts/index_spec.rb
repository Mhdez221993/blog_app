require 'rails_helper'

RSpec.describe "Post index page", type: :feature do
  before(:each) do
    @user = User.create! name: 'Doe', email: 'doe@gmail.com', password: '1233456', confirmed_at: Time.now
    @user.posts.create! title: 'Loren1', text: 'Lorem ipsum amet'
    @user.posts.create! title: 'Loren2', text: 'Lorem ipsum amet'
    visit user_session_path
    fill_in 'Email', with: 'doe@gmail.com'
    fill_in 'Password', with: '1233456'
    click_on 'Log in'
    visit user_posts_path(@user)
  end

  it "I can see the user's profile picture." do
    expect(page).to have_css('img', count: 1)
  end

  it "I can see the user's username." do
    expect(page).to have_content('Doe')
  end
end
