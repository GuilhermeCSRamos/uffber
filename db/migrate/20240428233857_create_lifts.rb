class CreateLifts < ActiveRecord::Migration[7.1]
  def change
    create_table :lifts do |t|
      t.references :driver, null: false, foreign_key: true
      t.references :passenger, null: false, foreign_key: true
      t.string :start_location
      t.string :end_location

      t.timestamps
    end
  end
end
