class CreateParticipantes < ActiveRecord::Migration[7.1]
  def change
    create_table :participantes do |t|
      t.integer :estado, null: false, default: 2


      t.date :fecha_solicitud, null: false


      t.date :fecha_confirmacion

   
      t.references :cliente, null: false, foreign_key: true


      t.references :torneo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
