class CreateComentarios < ActiveRecord::Migration[7.1]
  def change
    create_table :comentarios do |t|
      t.string :titulo, limit: 50
      t.string :corpo, limit: 200
      t.references :usuario, foreign_key: true, null: false
      t.references :carona, foreign_key: true, null: false

      t.timestamps
    end
  end
end
