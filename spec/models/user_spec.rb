require 'rails_helper'

RSpec.describe User, type: :model do
  it 'eager loads all files without errors' do
    expect { Rails.application.eager_load! }.not_to raise_error
  end

  it 'is valid with valid attributes' do
    user = User.new(name: 'John', bio: 'Jons Bio', posts_counter: 0)
    expect(user).to be_valid
  end

  it 'is valid presence of posts_counter' do
    user = User.new(name: 'John', bio: 'Jons Bio')
    expect(user).to be_invalid
  end

  it 'is valid posts_counter >= 0' do
    user = User.new(name: 'John', bio: 'Jons Bio', posts_counter: -2)
    expect(user).to be_invalid
  end

  it 'is valid the presence of name' do
    user = User.new(bio: 'Jons Bio', posts_counter: 2)
    expect(user).to be_invalid
  end

  it 'is valid name is not black' do
    user = User.new(name: '', bio: 'Jons Bio', posts_counter: 2)
    expect(user).to be_invalid
  end
end
