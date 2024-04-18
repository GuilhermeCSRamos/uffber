class CreatePassageiroViagems < ActiveRecord::Migration[7.1]
  def change
    create_table :passageiro_viagems do |t|

      t.timestamps
    end
  end
end
