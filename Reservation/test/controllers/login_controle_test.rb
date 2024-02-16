require 'test_helper'

class LoginControlTest < ActionDispatch::IntegrationTest

  setup do
    user = users(:user1)
    valid_params = {"auth"=>{"email"=>"sample1@example.com", "password"=> "sample1"}}
    post auths_url(valid_params)
  end

  test "トップページの接続" do
    get rooms_url
    assert_response :success
  end

  test "会議室一覧画面を表示" do
    get rooms_url
    assert_response :success
  end

  test "会議室の登録画面を表示、登録実行" do
    get new_room_url
    assert_response :success
    post rooms_url, params: { room: { name: "テスト部屋#02", place: "東京", number: 10 }}
    assert_equal flash[:notice], "Room was successfully created."
  end
end
