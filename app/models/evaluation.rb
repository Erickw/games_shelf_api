class Evaluation < ApplicationRecord
  belongs_to :user

  validates :rating, presence: true, numericality: { only_integer: true, in: 1..10 }
  validates :game_name, presence: true
end
