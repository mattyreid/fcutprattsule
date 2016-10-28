class CapsuleController < ApplicationController
    
  before_action :authenticate_user!

  def create
    @capsule = Capsule.new(tweet_id: params[:tweet_id], user: current_user)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @capsule = Capsule.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

end
