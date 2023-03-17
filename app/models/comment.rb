class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :comments_counter_updater

  def comments_counter_updater
    post = Post.find_by(id: post_id)
    post.comments_counter = Comment.where(author_id:).count
    post.save
  end
end
