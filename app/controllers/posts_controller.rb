class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find_by(id: params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).includes(:comments)

    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text).merge(author_id: current_user.id, comments_counter: 0,
                                                                       likes_counter: 0))

    respond_to do |format|
      format.html do
        if @post.save
          redirect_to user_post_path(current_user, @post)
        else
          redirect_to new_user_post_path(current_user)
        end
      end
    end
  end

  def destroy
    @post.comments.destroy_all
    @post.destroy
    redirect_to user_path(params[:user_id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
