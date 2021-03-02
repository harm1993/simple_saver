class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions

  validates :name, presence: true, uniqueness: true
  validates :goal_per_month, presence: true
end
