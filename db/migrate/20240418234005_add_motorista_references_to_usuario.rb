class AddMotoristaReferencesToUsuario < ActiveRecord::Migration[7.1]
  def change
    add_reference :usuarios, :motorista, foreign_key: true, null: false
    add_reference :usuarios, :usuario, null: false, foreign_key: true
  end
end
