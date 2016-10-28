class PagesController < ApplicationController
  
  # back-end code for pages/index
  def index
  end
  
  # back-end code for pages/home
  def home
  end
  
  # back-end code for pages/profile
  def profile
  end
  
  # back-end code for pages/explore
  def explore
    @tweets = Tweet.where("user_id in (?) OR user_id = ?", current_user.friend_ids, current_user).paginate(page: params[:page]).order('created_at DESC')
    @tweets = Tweet.all.last(10)
    @tofollow = User.all.last(5)
  end
  
  # back-end code for pages/search
  def search
  end 
  
  # back-end code for pages/search
  def search_results
    @tweets = Tweet.where("user_id in (?) OR user_id = ?", current_user.friend_ids, current_user).paginate(page: params[:page]).order('created_at DESC')
    @tweets = Tweet.search(params[:search])
    @tofollow = User.all.last(5)
  end
end 

