require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  test "ユーザー(親)を削除すると、エントリー(子)も削除される" do
    user1 = users(:user1)
    entry1 = entries(:entry1)
    assert_difference "Entry.count", -1 do
      user1.destroy!
    end
  end

  test "Entryモデル登録検証" do
    user1 = users(:user1)
    room1 = rooms(:room2)
    assert_difference "Entry.count", 1 do
      Entry.create!(
        user: user1, 
        reserved_date: "2023-03-25 05:42:32", 
        usage_time: 2,
        room: room1,
        people: 5
      )
    end
  end

  test "Entryモデル更新検証" do
    entry1 = entries(:entry1)
    user2 = users(:user2)
    entry1.user = user2
    assert_equal(user2, entry1.user)
  end

  test "Entryモデル削除検証" do
    entry = entries(:entry1)
    assert_difference "Entry.count", -1 do
      entry.destroy!
    end
  end
end
