class CreatePassageiros < ActiveRecord::Migration[7.1]
  def change
    create_table :passageiros do |t|

      t.timestamps
    end
  end
end
