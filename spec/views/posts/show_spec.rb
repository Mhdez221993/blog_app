require 'rails_helper'

RSpec.describe "Pos show page", type: :feature do
  before(:each) do
    @user = User.create! name: 'Doe', email: 'doe@gmail.com', password: '1233456', confirmed_at: Time.now
    @post = @user.posts.create! title: 'Loren1', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
    @post.comments.create! text: 'Consectetur adipiscing elit', user_id: @user.id
    Like.create! post_id: @post.id, user_id: @user.id

    visit user_session_path
    fill_in 'Email', with: 'doe@gmail.com'
    fill_in 'Password', with: '1233456'
    click_on 'Log in'
    visit user_post_path(@user, @post)
  end

  it "I can see the post's title." do
    expect(page).to have_content('Loren1')
  end

  it "I can see who wrote the post." do
    expect(page).to have_content('Doe')
  end

  it "I can see how many comments it has." do
    expect(page).to have_content('1 Comment')
  end
end
