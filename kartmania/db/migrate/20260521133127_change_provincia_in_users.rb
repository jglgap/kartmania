class ChangeProvinciaInUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :provincia, :string
    add_reference :users, :provincia, null: true, foreign_key: true
  end
end
