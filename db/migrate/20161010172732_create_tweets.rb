class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :username
      t.string :tweet
      t.string :party
      t.float :lat
      t.float :long
      t.timestamps
    end
  end
end
