require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
  before(:each) do
    @user = User.create! name: 'Doe', email: 'doe@gmail.com', password: '1233456', confirmed_at: Time.now
    @post = @user.posts.create! title: 'Loren1', text: 'Lorem ipsum amet1 Lorem ipsum amet1'
    @user.posts.create! title: 'Loren2', text: 'Lorem ipsum amet2 Lorem ipsum amet2'
    @user.posts.create! title: 'Loren2', text: 'Lorem ipsum amet3'
    @user.posts.create! title: 'Loren2', text: 'Lorem ipsum amet4'
    @post.comments.create! text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', user_id: @user.id
    @post.comments.create! text: 'Consectetur adipiscing elit', user_id: @user.id
    Like.create! post_id: @post.id, user_id: @user.id
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

  it 'I can see the number of posts the user has written.' do
    expect(page).to have_content('4 Post')
  end

  it "I can see a post's title." do
    expect(page).to have_content('Loren1')
    expect(page).to have_content('Loren2')
  end

  it "I can see some of the post's body." do
    expect(page).to have_content('Lorem ipsum amet1 Lo...')
    expect(page).to have_content('Lorem ipsum amet2 Lo...')
  end

  it 'I can see the first comments on a post.' do
    expect(page).to have_content('Lorem ipsum dolor si...')
    expect(page).to have_content('Consectetur adipisci...')
  end

  it 'I can see how many comments a post has.' do
    expect(page).to have_content('2 Comments')
  end

  it 'I can see how many likes a post has.' do
    expect(page).to have_content('1 Like')
  end

  it 'I can see a section for pagination if there are more posts than fit on the view.' do
    expect(page).to have_content('‹ Prev12Next ›')
  end

  it "When I click on a post, it redirects me to that post's show page." do
    click_on 'Loren1'
    expect(current_path).to eq user_post_path(@user, @post)
  end
end
