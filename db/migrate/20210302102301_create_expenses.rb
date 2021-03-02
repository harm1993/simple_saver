class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.float :amount
      t.string :place
      t.date :date
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
