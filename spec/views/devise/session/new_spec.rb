require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  before(:each) do
    visit user_session_path
  end

  it 'I can see the username and password inputs and the "Submit" button' do
    expect(page).to have_field(type: 'email')
    expect(page).to have_field(type: 'password')
    expect(page).to have_button(type: 'submit')
  end
end
