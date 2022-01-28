require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = User.create(name: 'John', bio: 'Jons Bio', posts_counter: 0)
  end

  it 'is valid with valid attributes' do
    post = @user.posts.new(title: 'Lord', text: 'Best', comments_counter: 0, likes_counter: 0)
    expect(post).to be_valid
  end

  it 'is valid presence of comments_counter' do
    post = @user.posts.new(title: 'Lord of the rings', text: 'Best seller book')
    expect(post).to be_invalid
  end

  it 'is valid comments_counter >= 0' do
    post = @user.posts.new(title: 'Lord of the rings', text: 'Best seller book', comments_counter: -2, likes_counter: 0)
    expect(post).to be_invalid
  end

  it 'is valid the presence of title' do
    post = @user.posts.new(text: 'Best seller book', comments_counter: 2, likes_counter: 0)
    expect(post).to be_invalid
  end

  it 'is valid title is not black' do
    post = @user.posts.new(title: '', text: 'Best seller book', comments_counter: 2, likes_counter: 0)
    expect(post).to be_invalid
  end

  it 'should be able to save posts' do
    post = @user.posts.new(title: 'Lord of the rings', text: 'Best seller book', comments_counter: 0, likes_counter: 0)
    expect(post.save).to eq(true)
  end

  it 'should count the comments' do
    post = @user.posts.new(title: 'Lord of the rings', text: 'Best seller book', comments_counter: 2, likes_counter: 0)
    expect(post.comments_counter).to eq(2)
  end

  it 'should count the comments' do
    post = @user.posts.new(title: 'Lord of the rings', text: 'Best seller book', comments_counter: 0, likes_counter: 5)
    expect(post.likes_counter).to eq(5)
  end
end
