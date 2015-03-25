class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :vehicle
      t.text :description

      t.timestamps null: false
    end
  end
end
