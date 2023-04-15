class Book < ApplicationRecord
  validates :title, presence: true
  validates :description, absence: true, unless: :title?
  validates :description, length: {maximum: 100}
end
