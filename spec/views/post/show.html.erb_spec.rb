require 'rails_helper'

RSpec.describe 'Posts show view', type: :feature do
  describe 'Show page' do
    subject { User.create(name: 'Ahmad', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJHYna2rR4LtBNlA3gUSGxsmaiYY4PyxQEcA&usqp=CAU', bio: 'FL', posts_counter: 0) }

    it 'Display posts view content' do
      post = Post.create(author_id: subject.id, title: 'Hello 1', text: 'This is my post', comments_counter: 0,
                         likes_counter: 0)
      Post.create(author_id: subject.id, title: 'Hello 2', text: 'This is my post 2', comments_counter: 0,
                  likes_counter: 0)
      Post.create(author_id: subject.id, title: 'Hello 3', text: 'This is my post 3', comments_counter: 0,
                  likes_counter: 0)
      comment = Comment.create(author_id: subject.id, post_id: post.id, text: 'Test comment')
      visit user_posts_path(subject, post)

      expect(page).to have_content(post.title)
      expect(page).to have_content(subject.name)
      expect(page).to have_content('Comments: 1')
      expect(page).to have_content('Likes: 0')
      expect(page).to have_content(post.text)
      expect(page).to have_content('Ahmad: Test comment')
      expect(page).to have_content(comment.text)
    end
  end
end
