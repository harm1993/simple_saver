class RemoveUnusedTotMonthCategories < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :spend_per_month
  end
end
