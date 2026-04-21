class CreateKarts < ActiveRecord::Migration[7.1]
  def change
    create_table :karts do |t|

      # Tipo de kart — enum (0: inicial, 1: biplaza, 2: comun, 3: pro)
      t.integer :tipo , null:false, default: 0
      # Estado actual del kart — enum (0: disponible, 1: en_uso, 2: mantenimiento, 3: averiado)
      t.integer :estado, null: false , default: 0
      t.references :circuito, null: false, foreign_key: true

      t.timestamps
    end
  end
end
