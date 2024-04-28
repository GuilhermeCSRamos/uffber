class CreateDrivers < ActiveRecord::Migration[7.1]
  def change
    create_table :drivers do |t|
      t.string :cnh
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
