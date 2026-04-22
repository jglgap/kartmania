class CreateTorneos < ActiveRecord::Migration[7.1]
  def change
    create_table :torneos do |t|
t.string :nombre, null: false


      t.text :descripcion


      t.datetime :fecha_torneo, null: false


      t.string :primer_puesto


      t.string :segundo_puesto


      t.string :tercer_puesto


      t.decimal :primer_premio, precision: 8, scale: 2


      t.decimal :segundo_premio, precision: 8, scale: 2


      t.decimal :tercer_premio, precision: 8, scale: 2


      t.integer :numero_participantes, null: false


      t.integer :dificultad, null: false, default: 0


      t.references :circuito, null: true, foreign_key: true


      t.timestamps
    end
  end
end
