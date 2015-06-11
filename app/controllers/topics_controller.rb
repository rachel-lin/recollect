class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

     def create
       @topic = Topic.new(params.require(:topic).permit(:name, :description, :public))
       if @topic.save
         redirect_to @topic, notice: "Topic was saved successfully."
       else
         flash[:error] = "Error creating topic. Please try again."
         render :new
       end
     end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def edit
    @topic = Topic.find(params[:id])
    @bookmark = Bookmark.find(params[:id])
  end

    def update
       @topic = Topic.find(params[:id])
       if @topic.update_attributes(params.require(:topic).permit(:name, :description, :public))
         redirect_to @topic
       else
         flash[:error] = "Error saving topic. Please try again."
         render :edit
       end
     end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to @topics
  end


 
end
