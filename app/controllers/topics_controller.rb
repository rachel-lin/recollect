class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @topics = Topic.paginate(page: params[:page], per_page: 5)
    authorize @topics
  end

  def new
    
    @topic = Topic.new
    authorize @topic
  end

     def create

        @topic = current_user.topics.build(topic_params)

       authorize @topic
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
    @bookmarks = @topic.bookmarks.paginate(page: params[:page], per_page: 5)
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
    authorize @topic
  end

    def update
       @topic = Topic.find(params[:id])
       authorize @topic
       if @topic.update_attributes(topic_params)
         redirect_to @topic
       else
         flash[:error] = "Error saving topic. Please try again."
         render :edit
       end
     end

  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic
    @topic.destroy
    redirect_to @topics
  end


private

 def topic_params
   params.require(:topic).permit(:name, :public, :thumbnail)
 end
 
end
