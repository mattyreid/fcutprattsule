class FindFriendsController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all.last(5)
    @tofollow = User.all.last(6)
    respond_to do |format|
      format.js
      format.html
    end
  end
end
