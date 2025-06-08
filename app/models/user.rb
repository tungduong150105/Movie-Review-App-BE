class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  has_many :watchlist
  has_many :rating
  has_many :recent
end
