class User < ApplicationRecord
  has_secure_password

  has_many :lists, dependent: :destroy
  has_many :evaluations, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
