class Goal < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  scope :completed_goals, -> { where(completed: true) }

  def percentage
    (1..100).to_a.sample.to_f / 100

    # the current method is provvisory to test the js proress bar out
    # >> CHANGE TO <<
    # self.archieved_amount.to_f / self.amount / 100

    # TODO
    # option to make a transaction >to< the archieved amount
    # which is the savings account for a given goal
    # (and also a new column in Goals table)
  end
end
