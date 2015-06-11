class BookmarksController < ApplicationController
  def show
  	@topic = Topic.find(params[:topic_id])
  	@bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

       def create
       @topic = Topic.find(params[:topic_id])
       @bookmark = Bookmark.new(params.require(:bookmark).permit(:name, :url))
       if @bookmark.save
          flash[:notice] = "Bookmark was saved."
          redirect_to [@topic, @bookmark]
       else
         flash[:error] = "Error saving bookmark. Please try again."
         render :new
       end
     end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

      def update
       @topic = Topic.find(params[:topic_id])
       @bookmark = Bookmark.find(params[:id])
       if @bookmark.update_attributes(params.require(:bookmark).permit(:name, :url))
          flash[:notice] = "Bookmark changes was saved."
          redirect_to [@topic, @bookmark]
       else
         flash[:error] = "Error saving bookmark. Please try again."
         render :edit
       end
     end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to :edit
  end
end


