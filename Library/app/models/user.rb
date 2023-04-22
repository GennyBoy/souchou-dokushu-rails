class User < ApplicationRecord
  validates :email, email_address: true
end
