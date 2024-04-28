class CreateLiftPassengers < ActiveRecord::Migration[7.1]
  def change
    create_table :lift_passengers do |t|
      t.references :lift, null: false, foreign_key: true
      t.references :passenger, null: false, foreign_key: true
      t.string :pickup_location
      t.string :dropoff_location

      t.timestamps
    end
  end
end
