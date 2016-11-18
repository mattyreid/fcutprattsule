class LikesController < ApplicationController
    
  before_action :authenticate_user!

  def create
    @like = Likes.new(tweet_id: params[:tweet_id], user: current_user)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @like = Like.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

end

