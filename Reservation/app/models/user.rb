class User < ApplicationRecord
  has_many :entries, dependent: :destroy

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
end
