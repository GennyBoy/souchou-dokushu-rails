# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: "admin",
  email: "admin@example.com",
  password: BCrypt::Password.create("admin"),
  admin: true,
)

user = User.create!(name: "テストユーザー１", email: "test1@example.com", password: BCrypt::Password.create("test"), admin: false,)
room = Room.create!(name: "テスト部屋#01", place: "東京", number: 10, terms_of_use: nil)
room.images.attach(io: File.open(Rails.root.join('app/assets/images/room01_1.png')), filename: 'room01_1.png')
room.images.attach(io: File.open(Rails.root.join('app/assets/images/room01_2.png')), filename: 'room01_2.png')
Entry.create!(room_id: room.id, user_id: user.id, reserved_date: Time.now, usage_time: 3, people: 5)

room = Room.create!(name: "テスト部屋#02", place: "東京", number: 10, terms_of_use: nil)
room.images.attach(io: File.open(Rails.root.join('app/assets/images/room01_1.png')), filename: 'room01_1.png')
room.images.attach(io: File.open(Rails.root.join('app/assets/images/room01_2.png')), filename: 'room01_2.png')

room = Room.create!(name: "テスト部屋#03", place: "東京", number: 10, terms_of_use: nil)
room.images.attach(io: File.open(Rails.root.join('app/assets/images/room01_1.png')), filename: 'room01_1.png')
room.images.attach(io: File.open(Rails.root.join('app/assets/images/room01_2.png')), filename: 'room01_2.png')
