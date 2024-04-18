class CreateViagems < ActiveRecord::Migration[7.1]
  def change
    create_table :viagems do |t|
      t.string :partida, limit: 100
      t.string :destino, limit: 100
      t.date :horario_partida
      t.references :motorista, foreign_key: true, null: false
      t.references :passageiro, foreign_key: true, null: false

      t.timestamps
    end
  end
end
