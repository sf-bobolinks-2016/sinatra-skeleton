class CreateClintons < ActiveRecord::Migration
  def change
   	 create_table :clintons do |t|
      t.string :body
      t.string :username 
      t.timestamps
  	 end	
  end
end
