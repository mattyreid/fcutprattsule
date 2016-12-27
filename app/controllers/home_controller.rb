class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @tweets = Tweet.where("user_id in (?) OR user_id = ?", current_user.friend_ids, current_user).paginate(page: params[:page]).order('created_at DESC')
    @activities = PublicActivity::Activity.order("created_at desc")
    @hashtags = SimpleHashtag::Hashtag.all.last(6)
    @tofollow = User.all.last(3)
  end
end
