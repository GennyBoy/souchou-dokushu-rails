# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do |n|
  # バリデーションエラーで失敗するようになったので後で確認
  Room.create!(
    name: "部屋番号: #{n}",
    number: 4
  )

  Entry.create!(
    user_name: "ユーザー名: #{n}",
    reserved_date: Time.now,
  )
end

Entry.create!(
  user_name: "ユーザー名: 古い予約",
  reserved_date: "2019-02-10".to_date,
)

Entry.create!(
  user_name: "ユーザー名: 未来の予約",
  reserved_date: "2024-02-10".to_date,
)
