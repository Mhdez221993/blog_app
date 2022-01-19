require 'rails_helper'

describe 'Users', type: :request do
  before(:example) { get users_path } # get(:index)
  it 'is a success' do
    expect(response).to have_http_status(:ok)
  end

  it 'renders index template' do
    expect(response).to render_template('index')
  end

  it 'assigns all users to @users' do
    get users_path
    expect(assigns(:users)).to eq(User.all)
  end
end

describe 'Users', type: :feature do
  it 'verify root path' do
    visit '/'
    expect(current_path).to eq(root_path)
  end

  it 'find specific test on the page' do
    visit '/users/1'
    expect(page).to have_text('Bio')
  end
end
