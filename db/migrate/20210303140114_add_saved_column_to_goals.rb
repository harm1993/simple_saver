class AddSavedColumnToGoals < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :saved, :decimal, default: 0.0
  end
end
