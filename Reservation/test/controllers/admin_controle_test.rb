require 'test_helper'

class AdminControlTest < ActionDispatch::IntegrationTest

  setup do
    user = users(:user1)
    valid_params = {"auth"=>{"email"=>"sample1@example.com", "password"=> "sample1"}}
    post auths_url(valid_params)
  end

  test "会議室の登録画面を表示、登録実行" do
    get new_room_url
    assert_response :success
    post rooms_url, params: { room: { name: "テスト部屋#02", place: "東京", number: 10 }}
    assert_equal flash[:notice], "Room was successfully created."
  end

   test "会議室の編集" do
    get edit_room_url(rooms(:room1))
    assert_response :success
    patch room_url(rooms(:room1)), params: { room: { name: "変更したお部屋名#02", place: "東京", number: 10 }}
    assert_equal flash[:notice], "Room was successfully updated."
  end 
  
  test "会議室の削除" do
    delete room_url(rooms(:room1))
    assert_equal flash[:notice], "Room was successfully destroyed."
  end

end