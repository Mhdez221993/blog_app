require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  before(:each) do
    @user = User.create! name: 'user1', email: 'user1@example.com',
                         password: 'password', confirmed_at: Time.now
    @user2 = User.create! name: 'user2', email: 'user2@example.com',
                          password: 'password', confirmed_at: Time.now
    @post = @user.posts.create! title: 'Lorem ipsum', text: 'Lorem ipsum dolor sit amet'
    (1..4).each do
      @post.comments.create! text: 'Sit amet Lorem ipsum dolor', user_id: @user.id
      @post.comments.create! text: 'Sit amet Lorem ipsum dolor', user_id: @user2.id
    end
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

  it 'I can see how many comments it has' do
    expect(page).to have_content '8 Comments'
  end

  it 'I can see how many likes it has' do
    expect(page).to have_content '10 Likes'
  end

  it 'I can see the post body' do
    expect(page).to have_content 'Sit amet Lorem ipsum dolor'
  end

  it 'I can see the username of each commentor' do
    expect(page).to have_content 'Name: user1 Comment'
    expect(page).to have_content 'Name: user2 Comment'
  end

  it 'I can see the comment each commentor left' do
    expect(page).to have_content 'Name: user1 Comment: Sit amet Lorem ipsum dolor'
    expect(page).to have_content 'Name: user2 Comment: Sit amet Lorem ipsum dolor'
  end
end
