class ChangeCircuitoNullInKarts < ActiveRecord::Migration[7.1]
  def change
    change_column_null :karts, :circuito_id, true
  end
end
