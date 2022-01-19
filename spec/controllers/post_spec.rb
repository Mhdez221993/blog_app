require 'rails_helper'

describe 'Post', type: :request do
  before(:example) { get user_posts_path(user_id: 5) }
  it 'is a success' do
    expect(response).to have_http_status(:ok)
  end

  it 'renders index template' do
    expect(response).to render_template('index')
  end
end

describe 'Post', type: :feature do
  it 'verify the posts for a user with id = 2' do
    visit '/users/2/posts'
    expect(current_path).to eq(user_posts_path(user_id: 2))
  end

  it 'find specific text on post page' do
    visit 'users/1/posts/1'
    expect(page).to have_text('posts#show')
  end
end
