class AddVideoToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :video, :string
  end
end
