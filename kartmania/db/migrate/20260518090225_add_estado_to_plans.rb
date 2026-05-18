class AddEstadoToPlans < ActiveRecord::Migration[7.1]
  def change
    add_column :plans, :estado, :integer
  end
end
