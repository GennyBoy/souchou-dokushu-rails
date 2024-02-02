require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  test "名前が空欄の時にメッセージを出す" do
    room1 = rooms(:room1)
    room1.name = ""
    room1.valid?
    assert room1.errors.messages[:name].include?("会議名の入力は必須です")
  end

  test "場所が横浜の時にメッセージを出す" do
    room1 = rooms(:room1)
    room1.place = "横浜"
    room1.valid?
    p room1.errors.messages
    assert room1.errors.messages[:place].include?("は一覧にありません")
  end

  test "人数が5の倍数でない時にメッセージを出す" do
    room1 = rooms(:room1)
    room1.number = 6
    assert !room1.valid?
    assert room1.errors.messages[:number].include?("は5の倍数で入力してください")
  end
end
