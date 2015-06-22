class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  


    def update
        if current_user.update_attributes(user_params)
          flash[:notice] = "User information updated"
          redirect_to edit_user_registration_path
        else 
          flash[:error] = "Invalid user information"
          redirect_to edit_user_registration_path
        end
    end

    def show
      @user = User.find(params[:id])
      @bookmarks = @user.bookmarks
      @topic = Topic.find(params[:id])
      @liked_bookmarks = Bookmark.where(id: current_user.likes.pluck(:bookmark_id))
    end

    private

    def user_params
      params.require(:user).permit(:name, :avatar)
    end

end
