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

  it "I can see the user's username" do
    expect(page).to have_content 'user1'
  end

  it 'I can see the number of posts the user has written' do
    expect(page).to have_content '4 Posts'
  end

  it "I can see a post's title" do
  end

  it "I can see some of the post's body" do
  end

  it 'I can see the first comments on a post' do
  end

  it 'I can see how many comments a post has' do
  end

  it 'I can see how many likes a post has' do
  end

  it 'I can see a section for pagination if there are more posts than fit on the view' do
  end

  it "When I click on a post, it redirects me to that post's show page" do
  end
end
