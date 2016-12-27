class Favorite < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :user
  acts_as_votable
  include PublicActivity::Model
  tracked
end
