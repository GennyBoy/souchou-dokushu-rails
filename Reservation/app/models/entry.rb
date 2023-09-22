class Entry < ApplicationRecord
  belongs_to :room

  scope :least_entries,->(base_date) {
    where("reserved_date >= ? and reserved_date <= ?",
    base_date.to_date - 7.days, base_date.to_date + 7.days )
  }

  validates :user_name, :user_email, :reserved_date, :usage_time, presence: true
  validates :user_email, uniqueness: true
end
