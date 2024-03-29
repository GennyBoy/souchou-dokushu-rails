class Book < ApplicationRecord
  has_many_attached :images
  has_one_attached :sample
  has_many :rentals
  has_many :users, through: :rentals
  has_many :pictures, as: :imageable

  scope :date_regist, ->(date) { where("created_at <= ?", date) }

  validates :title, :images, presence: true
  validates :description, absence: true, unless: :title?
  validates :description, length: {maximum: 100}

  before_save MessageOut
  before_validation MessageOut

  after_find :find_message
  after_initialize :initialize_message

  private
  def find_message
    puts "読みました"
  end
  def initialize_message
    puts "インスタンス化しました"
  end
end
