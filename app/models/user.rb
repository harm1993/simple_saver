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

#  validates :first_name, presence: true
#  validates :date_of_birth, presence: true
end
