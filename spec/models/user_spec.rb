require 'rails_helper'

RSpec.describe User, type: :model do
  let(:params) { { name: 'John', posts_counter: 0 } }
  before(:each) do
    User.create(params)
    User.create(params)
    User.create(params)
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

  it 'Shoud return all active records' do
    expect(User.count).to eq(3)
  end
end
