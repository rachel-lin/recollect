class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
      @bookmarks = @user.bookmarks
      @topic = Topic.find(params[:id])
      @liked_bookmarks = @user.likes
    end


end
