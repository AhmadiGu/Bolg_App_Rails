class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  def posts_counter_updater
    author.increment!(:posts_counter)
    # user = User.find_by(id: author_id)
    # user.posts_counter = Post.where(author_id:).count
    # user.save
  end

  def recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
