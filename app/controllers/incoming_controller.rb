class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    @user = User.find_by(email: params[:sender])
    @topic = Topic.find_by(name: params[:subject])

    @name = params["body-plain"]
    @url = params["body-plain"]

  if @user.nil?
    @user = User.new(email: params[:sender], password: "helloworld")
    @user.skip_confirmation!
    @user.save!
  end

  if @topic.nil?
    @topic = @user.topics.create(name: params[:subject])
  end

  @bookmark = @topic.bookmarks.create(name: @url, url: @url)

    head 200
  end
end
