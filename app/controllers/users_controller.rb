class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
      @bookmarks = @user.bookmarks
      @topic = Topic.find(params[:id])
      @liked_bookmarks = Bookmark.where(id: current_user.likes.pluck(:bookmark_id))
    end


end
