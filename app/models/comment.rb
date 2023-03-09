class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def comments_counter_updater(post_id)
    post = Post.find_by(id: post_id)
    post.likes_counter = Comment.where(author_id:).count
    post.save
  end
end
