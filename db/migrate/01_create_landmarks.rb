class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |l|
      l.string :name
    end
end
