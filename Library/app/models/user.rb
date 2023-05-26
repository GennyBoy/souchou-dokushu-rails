class User < ApplicationRecord
  has_many :rentals
  has_many :books, through: :rentals
  has_many :pictures, as: :imageable

  validates :email, email_address: true
end
