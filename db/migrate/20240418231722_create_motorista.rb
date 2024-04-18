class CreateMotorista < ActiveRecord::Migration[7.1]
  def change
    create_table :motorista do |t|

      t.timestamps
    end
  end
end
