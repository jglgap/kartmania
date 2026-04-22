class CreatePlans < ActiveRecord::Migration[7.1]
  def change
    create_table :plans do |t|
      t.string :nombre , null:false
      t.text :descripcion
      t.decimal :precio , precision: 8 , scale: 2, null: false
      t.integer :max_participantes, null: false
      t.references :circuito, null: true, foreign_key: true

      t.timestamps
    end
  end
end
