class UsersController < ApplicationController
  def show

  	@user = User.find(params[:user_id])
    @user_bookmarks = @user.bookmarks
    @liked_bookmarks = 	@user.likes
  end
end
