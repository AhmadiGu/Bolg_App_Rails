require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Fuad')
  user.id = 1
  subject { Post.new(author_id: user.id, title: 'Hello', text: 'This is my post') }

  before { subject.save }

  context 'Testing validation' do
    it 'Title should be invalid with nil value' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Title must not exceed 250 characters' do
      expect(subject.title.length).to be <= 250
    end

    it 'CommentsCounter must be an integer greater than or equal to zero.' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'LikesCounter must be an integer greater than or equal to zero.' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end
end
