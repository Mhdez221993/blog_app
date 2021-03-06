require 'rails_helper'

RSpec.describe 'user show page', type: :feature do
  before(:each) do
    @user = User.create! name: 'user1', bio: 'My bio',
                         email: 'user1@example.com',
                         password: 'password', confirmed_at: Time.now
    (1..4).each { |i| @user.posts.create! title: "Lorem ipsum#{i}", text: 'Lorem ipsum dolor sit amet' }
    visit user_session_path
    fill_in 'Email', with: 'user1@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    visit user_path(@user)
  end

  it "I can see the user's profile picture" do
    expect(page).to have_css 'img', count: 1
  end

  it "I can see the user's usernam" do
    expect(page).to have_content 'user1'
  end

  it 'I can see the number of posts the user has written' do
    expect(page).to have_content '4 Posts'
  end

  it "I can see the user's bio" do
    expect(page).to have_content 'Bio'
    expect(page).to have_content 'My bio'
  end

  it "I can see the user's first 3 posts" do
    expect(page).to have_content 'Lorem ipsum1'
    expect(page).to have_content 'Lorem ipsum2'
    expect(page).to have_content 'Lorem ipsum3'
    expect(page).to have_no_content 'Lorem ipsum4'
  end

  it "I can see a button that lets me view all of a user's posts" do
    expect(page).to have_content 'All Posts'
  end

  it "When I click a user's post, it redirects me to that post's show page" do
    post = Post.find_by_title 'Lorem ipsum1'
    click_on 'Lorem ipsum1'
    expect(current_path).to eq user_post_path(@user, post)
  end

  it "When I click to see all posts, it redirects me to the user's post's index page" do
    click_on 'All Posts'
    expect(current_path).to eq user_posts_path(@user)
  end
end
