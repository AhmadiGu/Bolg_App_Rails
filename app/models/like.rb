class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def likes_counter_updater
    author.increment!(:likes_counter)
    # post = Post.find_by(id: post_id)
    # post.likes_counter = Like.where(author_id:).count
    # post.save
  end
end
