class CreateTrumps < ActiveRecord::Migration
  def change
  	 create_table :trumps do |t|
      t.string :body
      t.string :username 
      t.timestamps
  	 end	
  end
end
