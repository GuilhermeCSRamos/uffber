class CreateLifts < ActiveRecord::Migration[7.1]
  def change
    create_table :lifts do |t|
      t.references :driver, null: true, foreign_key: true
      t.references :passenger, null: true, foreign_key: true
      t.integer :status
      t.string :start_location
      t.string :end_location

      t.timestamps
    end
  end
end
