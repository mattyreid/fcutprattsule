class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  attr_accessor :login

  self.per_page = 20

  extend FriendlyId
  friendly_id :username, use: [:slugged, :finders]

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, length: { maximum: 100 }
  validates :username, presence: true, length: { maximum: 20 }, :uniqueness => { case_sensitive: false }

  has_many :tweets
  has_many :relationships
  has_many :friends, through: :relationships
  has_many :inverse_relationships, class_name: "Relationship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_relationships, source: :user
  has_many :favorites
  has_many :likes
  has_many :retweets, foreign_key: "retweeter_id"

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover, CoverUploader
  
  acts_as_messageable
  
  acts_as_liker
  
  is_impressionable
  
  acts_as_votable
  
  def mailboxer_email(object)
   #return the model's email here
  end


  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
  
  def self.search(search)
  where("name LIKE ?", "%#{search}%")
  end 
  
  include PublicActivity::Model
  tracked
end
