class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.references :driver, null: false, foreign_key: true
      t.string :model
      t.string :color
      t.string :license_plate
      t.integer :capacity
      t.integer :kind

      t.timestamps
    end
  end
end
