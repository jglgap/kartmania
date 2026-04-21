class CreateCircuitos < ActiveRecord::Migration[7.1]
  def change
    create_table :circuitos do |t|
      t.string :nombre , null:false
      t.string :kilometros, null:false
      t.text :descripcion

      t.timestamps
    end
  end
end
