class Category < ApplicationRecord
  belongs_to :user
  has_many :expenses, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :user }
  validates :goal_per_month, presence: true

  CATEGORIES_NAMES = ["Coffee", "Meals", "Delivery", "Shopping", "Cigarettes", "Other"]

  def tot_month(month = Date.today.month)
    self.expenses.where("EXTRACT(MONTH FROM created_at) = ?", month).sum(:amount)
  end

  def spent_percentage
    self.tot_month / self.goal_per_month
  end
end
