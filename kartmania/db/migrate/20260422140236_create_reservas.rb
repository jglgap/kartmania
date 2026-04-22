class CreateReservas < ActiveRecord::Migration[7.1]
  def change
    create_table :reservas do |t|

      t.datetime :fecha, null: false


      t.integer :estado, null: false, default: 2

      
      t.references :plan, null: true, foreign_key: true

      t.timestamps
    end
  end
end
