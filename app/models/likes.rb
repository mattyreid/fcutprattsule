class Likes < ActiveRecord::Base
belongs_to :tweet
belongs_to :user
include PublicActivity::Model
tracked
end

