class AddColumnDealineToGoal < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :deadline, :date
    rename_column :goals, :balance, :amount
  end
end
