require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = User.create(name: 'John', bio: 'Jons Bio', posts_counter: 0)
  end
  subject { @user.posts.new(title: 'Lord', text: 'Best', comments_counter: 0, likes_counter: 0) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is valid presence of comments_counter' do
    subject.comments_counter = nil
    expect(subject).to be_invalid
  end

  it 'is valid comments_counter >= 0' do
    subject.comments_counter = -2
    expect(subject).to be_invalid
  end

  it 'is valid the presence of title' do
    subject.title = nil
    expect(subject).to be_invalid
  end

  it 'is valid title is not black' do
    subject.title = ''
    expect(subject).to be_invalid
  end

  it 'should be able to save posts' do
    expect(subject.save).to eq(true)
  end

  it 'should count the comments' do
    subject.comments_counter = 10
    expect(subject.comments_counter).to eq(10)
  end

  it 'should count the likes' do
    subject.likes_counter = 5
    expect(post.likes_counter).to eq(5)
  end
end
