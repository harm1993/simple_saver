class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :categories, dependent: :destroy
  has_many :goals
  has_many :expenses, through: :categories

  def current_goal
    goals.find_by(completed: false)
  end

  def completed_goals
    goals.where(completed: true)
  end

  # Finance coach logic

  def total_categories
    categories.sum(:goal_per_month)
  end

  def saving_potential
    categories = self.categories
    unspent = []
    categories.each do |category|
      unspent << category.goal_per_month - category.tot_month
    end
    unspent.sum.to_i
  end

  def overall_progress
    unspent = total_categories - saving_potential
    unspent_per = unspent.to_f / total_categories * 100
    unspent_per.round(1)

    # categories = self.categories
    # percentages = []
    # categories.each do |category|
    #   percentages << category.spent_percentage
    # end
    # (percentages.sum / percentages.count * 100).to_i
  end

  def days_month_passed
    days_months = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

    amount_of_days = days_months[Date.today.month - 1]
    (Date.today.day.to_f / amount_of_days * 100).round(1)
  end

  def spending_type
    spenditure_status = days_month_passed - overall_progress

    if spenditure_status < -10.0
      "reckless-spender"
    elsif spenditure_status > 10
      "super-saver"
    else
      "responsible-spender"
    end
  end

  def spending_coach_text
    case spending_type
    when "reckless-spender"
      "Wow, slow it down m8"
    when "responsible-spender"
      "You're on the right track!"
    when "super-saver"
      "Wow, amazing this way your goal is reached super fast"
    else
      "There are no categories yet."
    end
  end

  # Statistics page

  def percentage_goal
    (current_goal.saved.to_f / current_goal.amount * 100).round(1)
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
