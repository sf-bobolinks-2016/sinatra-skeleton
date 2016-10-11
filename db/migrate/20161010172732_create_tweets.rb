class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :tweet_body
      t.string :user
      t.timestamps
    end
  end
end
