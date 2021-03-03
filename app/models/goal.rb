class Goal < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  scope :completed_goals, -> { where(completed: true) }
end
