class AddEsTitularToClienteReservas < ActiveRecord::Migration[7.1]
  def change
    add_column :cliente_reservas, :es_titular, :boolean, null: false, default: false
  end
end
