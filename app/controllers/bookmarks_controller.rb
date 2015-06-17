class BookmarksController < ApplicationController


  def show
  	@topic = Topic.find(params[:topic_id])
  	@bookmark = Bookmark.find(params[:id])

  end

  def new
    @topic = Topic.find(params[:topic_id])
    @user = User.find(params[:user_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

       def create
       
       @topic = Topic.find(params[:topic_id])
       @user = User.find(params[:user_id])
       @bookmark = Bookmark.new(params.require(:bookmark).permit(:name, :url))
       @bookmark.topic = @topic
       @bookmark.user = @user
       @new_bookmark = Bookmark.new
       authorize @bookmark
       if @bookmark.save
          flash[:notice] = "Bookmark was saved."
          redirect_to @topic
       else
         flash[:error] = "Error saving bookmark. Please try again."
         render :new
       end
     end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

      def update
       @topic = Topic.find(params[:topic_id])
       @bookmark = Bookmark.find(params[:id])
       authorize @bookmark
       if @bookmark.update_attributes(params.require(:bookmark).permit(:name, :url))
          flash[:notice] = "Bookmark changes was saved."
          redirect_to [@topic, @bookmark]
       else
         flash[:error] = "Error saving bookmark. Please try again."
         render :edit
       end
     end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

     if @bookmark.destroy
       flash[:notice] = "Bookmark was removed."

     else
       flash[:error] = "Bookmark couldn't be deleted. Try again."
     end

     respond_to do |format|
       format.html
       format.js
     end
  end
end


