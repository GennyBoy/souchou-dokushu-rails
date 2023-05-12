class Room < ApplicationRecord
  validates :name,
    presence: { message: "会議名の入力は必須です" },
    length: { maximum: 30, message: "会議名は30文字以内で入力してください" },
    format: { with: /.*#\d{2}\z/, message: "会議名は「#数字」で終わる必要があります" }
  validates :place,
    presence: true,
    inclusion: [ "東京", "大阪", "福岡", "札幌", "仙台", "名古屋", "金沢" ]
  validates :number,
    presence: true,
    numericality: { greater_than_or_equal_to: 5, less_than_or_equal_to: 30 }
  validate :number_multiple_of_5

  private
  def number_multiple_of_5
    unless self.number % 5 == 0
      errors.add(:number, "は5の倍数で入力してください")
    end
  end
end
