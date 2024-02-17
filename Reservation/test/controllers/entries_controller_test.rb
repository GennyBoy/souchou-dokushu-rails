require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:user1)
    valid_params = {"auth"=>{"email"=>"sample1@example.com", "password"=> "sample1"}}
    post auths_url(valid_params)
    @room = rooms(:room1)
  end

  test "予約登録" do
    get new_room_entry_url(@room)
    assert_response :success

    post room_entries_url, params: { entry: { room_id: @room.id, user_id: @user.id, reserved_date: Date.today, usage_time: 1, people: 5}}
    assert_equal flash[:notice], "Entry was successfully created."
  end

  test "予約削除" do
    assert_difference "Entry.count", -1 do
      delete entry_url(Entry.last)
      assert_response :success
    end
  end
end
