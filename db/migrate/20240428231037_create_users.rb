class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :iduff
      t.integer :rating
      t.string :password

      t.timestamps
    end
  end
end
