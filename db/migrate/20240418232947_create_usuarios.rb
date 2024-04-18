class CreateUsuarios < ActiveRecord::Migration[7.1]
  def change
    create_table :usuarios do |t|
      t.string :nome, limit: 100
      t.string :iduff, limit: 11
      t.integer :tipo
      t.integer :reputacao

      t.timestamps
    end
  end
end
