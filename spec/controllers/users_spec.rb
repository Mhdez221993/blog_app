require 'rails_helper'

describe 'Users as root path', type: :feature do
  it 'verify root path' do
    visit '/'
    expect(current_path).to eq(root_path)
  end

  it 'find users#show text on page' do
    visit 'users/1'
    expect(page).to have_text('users#show')
  end
end

describe 'Users #index', type: :request do
  before(:example) { get users_path }
  it 'is a success' do
    expect(response).to have_http_status(:ok)
  end

  it 'renders index template' do
    expect(response).to render_template('index')
  end
end

describe 'Users #show', type: :request do
  before(:example) { get user_post_path(id: 1, user_id: 3) }
  it 'is a success' do
    expect(response).to have_http_status(:ok)
  end
end
