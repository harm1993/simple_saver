class Category < ApplicationRecord
  belongs_to :user
  has_many :expenses, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :goal_per_month, presence: true
end
