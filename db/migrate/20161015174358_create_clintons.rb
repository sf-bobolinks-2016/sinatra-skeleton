class CreateClintons < ActiveRecord::Migration
  def change
    create_table do |t|
     t.string = :tweet
    end
  end
end
