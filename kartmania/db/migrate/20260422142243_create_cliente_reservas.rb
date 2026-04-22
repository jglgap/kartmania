class CreateClienteReservas < ActiveRecord::Migration[7.1]
  def change
    create_table :cliente_reservas do |t|
      t.string :nombre, null: false

      t.string :email, null: false

      t.string :telefono

      t.string :dni, null: false

      t.references :cliente, null: true, foreign_key: true

  
      t.references :reserva, null: false, foreign_key: true

      t.timestamps
    end
  end
end
