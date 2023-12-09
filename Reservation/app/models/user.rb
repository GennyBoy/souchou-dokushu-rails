class User < ApplicationRecord
has_many :entries

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
end
