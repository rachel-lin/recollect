class LikesController < ApplicationController

	def create
		@topic = Topic.find(params[:topic_id])
		@bookmark = Bookmark.find(params[:bookmark_id])
		like = current_user.likes.build(bookmark: @bookmark)

		authorize like
		if like.save
          flash[:notice] = "Well, someone likes this bookmark!"
          redirect_to @topic
		else
          flash[:error] = "Try again!"
          redirect_to @topic
		end

	end


	def destroy
		@topic = Topic.find(params[:topic_id])
		@bookmark = Bookmark.find(params[:bookmark_id])
		like = current_user.likes.find(params[:id])

		authorize like
		if like.destroy
			flash[:notice] = "Looks like someone doesn't like this bookmark anymore!"
			redirect_to @topic
		else
			flash[:error] = "Let's try getting rid of that again"
			redirect_to @topic
		end
	end


end
