class CreateFigures < ActiveRecord::Migration
  def change
    crate_table :figures do |f|
      f.string :name
    end
  end
end
