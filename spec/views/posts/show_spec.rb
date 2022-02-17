require 'rails_helper'

RSpec.describe 'user index page', type: :feature do
  before(:each) do
    @user = User.create! name: 'user1', bio: 'My bio',
                         email: 'user1@example.com',
                         password: 'password', confirmed_at: Time.now
    @post = @user.posts.create! title: 'Lorem ipsum', text: 'Lorem ipsum dolor sit amet'
    (1..4).each { @post.comments.create! text: 'Sit amet Lorem ipsum dolor', user_id: @user.id }
    (1..10).each { @post.likes.create! user_id: @user.id }
    visit user_session_path
    fill_in 'Email', with: 'user1@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    visit user_post_path(@user, @post)
  end

  it "I can see the post's title" do
    expect(page).to have_content 'Lorem ipsum'
  end

  it 'I can see who wrote the post' do
    expect(page).to have_content 'Lorem ipsum by user1'
  end
end
