class CreateLiftsPassengers < ActiveRecord::Migration[7.1]
  def change
    create_join_table :lifts, :passengers do |t|
      t.index :lift_id
      t.index :passenger_id
      t.string :pickup_location
      t.string :dropoff_location

      t.timestamps
    end
  end
end
