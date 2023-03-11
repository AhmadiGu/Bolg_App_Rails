require 'rails_helper'
RSpec.describe User, type: :model do
  subject { User.new(name: 'Gul', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Student', posts_counter: 0) }

  before { subject.save }
  context 'Testing user validation' do
    it 'User is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'User is a valid with a name' do
      expect(subject).to be_valid
    end

    it 'User is not a valid with a negative posts_counter' do
      subject.posts_counter = -10
      expect(subject).to_not be_valid
    end

    it 'User is valid with a positive posts_counter' do
      expect(subject).to be_valid
    end
  end

  context 'Testing user behavior' do
    user = User.new(name: 'Ahmad')
    user.id = 1
    user.save

    before { 10.times { Post.create(author_id: user.id, title: 'Title', text: 'Text') } }
    it 'List the most 5 recent posts' do
      expect(user.recent_posts.length).to eq 5
    end
  end
end
