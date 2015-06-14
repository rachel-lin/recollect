class LikesController < ApplicationController

	def create
		@bookmark = Bookmark.find(params[:bookmark_id])
		like = current_user.likes.build(bookmark: @bookmark)

		authorize @like
		if like.save
          flash[:notice] = "Well, someone likes this bookmark!"
          redirect_to [@topic, @bookmark]
		else
          flash[:error] = "Try again!"
          redirect_to [@topic, @bookmark]
		end

	end


	def destroy
		@bookmark = Bookmark.find(params[:bookmark_id])
		like = current_user.likes.find(params[:id])

		authorize @like
		if like.destroy
			flash[:notice] = "Looks like someone doesn't like this bookmark anymore!"
			redirect_to [@topic, @bookmark]
		else
			flash[:error] = "Let's try getting rid of that again"
			redirect_to [@topic, @bookmark]
		end
	end


end
