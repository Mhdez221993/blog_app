require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'input data' do
    let(:params) { { name: 'John', posts_counter: 0 } }
    subject { User.new(params) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is valid presence of posts_counter' do
      subject.posts_counter = nil
      expect(subject).to be_invalid
    end

    it 'is valid posts_counter >= 0' do
      subject.posts_counter = -2
      expect(subject).to be_invalid
    end

    it 'is valid the presence of name' do
      subject.name = nil
      expect(subject).to be_invalid
    end

    it 'is valid name is not black' do
      subject.name = ''
      expect(subject).to be_invalid
    end
  end

  describe 'Association' do
    it { should have_many(:posts) }
  end
end
