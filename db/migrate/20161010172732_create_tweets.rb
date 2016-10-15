class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :username
      t.string :tweet
      t.string :party
      t.integer :lat
      t.integer :long
      t.timestamps
    end
  end
end
