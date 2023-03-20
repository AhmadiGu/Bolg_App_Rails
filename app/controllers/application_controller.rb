class ApplicationController < ActionController::Base
  def current_user
    # User.first
    User.find_by(id: params[:user_id])
  end
end
