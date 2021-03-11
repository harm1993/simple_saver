class AddAvatarToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :avatar, :integer, default: (1..6).to_a.sample
  end
end
