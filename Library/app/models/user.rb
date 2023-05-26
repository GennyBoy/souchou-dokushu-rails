class User < ApplicationRecord
  has_many :rentals
  has_many :books, through: :rentals
  validates :email, email_address: true
end
