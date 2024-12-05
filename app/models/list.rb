class List < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :game, presence: true
end
