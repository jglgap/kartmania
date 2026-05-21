class ChangeProvinciaInClientes < ActiveRecord::Migration[7.1]
  def change
    remove_column :clientes, :provincia, :string
    add_reference :clientes, :provincia, null: true, foreign_key: true
  end
end
