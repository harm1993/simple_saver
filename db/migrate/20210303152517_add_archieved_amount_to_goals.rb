class AddArchievedAmountToGoals < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :archieved_amount, :integer
  end
end
