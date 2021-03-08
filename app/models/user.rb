class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :categories, dependent: :destroy
  has_many :goals
  has_many :transactions, through: :categories

  def current_goal
    goals.find_by(completed: false)
  end

  def completed_goals
    goals.where(completed: true)
  end

  def overall_progress
    categories = self.categories
    percentages = []
    categories.each do |category|
      percentages << category.spent_percentage
    end
    (percentages.sum / percentages.count * 100).to_i
  end

  def saving_potential
    categories = self.categories
    unspent = []
    categories.each do |category|
      unspent << category.goal_per_month - category.tot_month
    end
    unspent.sum.to_i
  end

#  validates :first_name, presence: true
#  validates :date_of_birth, presence: true
end




# TODO #

# #Overall progress
#   > average of percentages of all categories 
#     (per month)
#
#   categories = current_user.categories
#   percentages [] = 
#   > categories.each > category.spent_percentage > push to array
#   > percentages.sum / percentages.count


# #Saving potential
#   > sum of the unspended amount from all categories
#     (per month)
#   
#   categories = current_user.categories
#   unspent [] = 
#   > categories.each > category.goal_per_month - category.tot_month > push to array
#   > unspended.sum 
