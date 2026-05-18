class ChangeEstadoDefaultInPlans < ActiveRecord::Migration[7.1]
  def change
    change_column_default :plans, :estado, from: nil, to: 0
    Plan.where(estado: nil).update_all(estado: 0)
  end
end
