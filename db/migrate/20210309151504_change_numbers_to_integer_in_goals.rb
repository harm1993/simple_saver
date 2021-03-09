class ChangeNumbersToIntegerInGoals < ActiveRecord::Migration[6.0]
  def change
    change_column :goals, :amount, :integer, :default =>  0
    change_column :goals, :saved, :integer, :default =>  0
  end
end
