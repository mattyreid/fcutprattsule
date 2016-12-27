class Tweet < ActiveRecord::Base
  
  self.per_page = 20
  
  belongs_to :user
  belongs_to :parent, class_name: "Tweet"
  has_many :replies, class_name: "Tweet", foreign_key: "parent_id"
  has_many :favorites
  has_many :likes
  has_many :friends
  has_many :retweets, foreign_key: "source_tweet_id"
  validates :tweet_text, presence: true, length: { maximum: 140 }

  counter_culture :user

  mount_uploader :media, MediaUploader
  mount_uploader :video, VideoUploader
  
  acts_as_votable
  
  acts_as_punchable
  
  def self.search(search)
  where("tweet_text LIKE ?", "%#{search}%")
  end
  
  def self.popularity(popularity)
  order("COALESCE(likes, ?) DESC").limit(5)
  end
  
  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :tweet_text
  
  include PublicActivity::Model
  tracked
  
end 
  
  