class AddGoogleEventIdToClienteReservas < ActiveRecord::Migration[7.1]
  def change
    add_column :cliente_reservas, :google_event_id, :string
  end
end
