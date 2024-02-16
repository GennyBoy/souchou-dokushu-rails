require 'test_helper'

class AuthsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_auths_url
    assert_response :success
  end

  test "ログイン成功" do
    user = users(:user1)
    valid_params = {"auth"=>{"email"=>"sample1@example.com", "password"=> "sample1"}}
    post auths_url(valid_params)
    assert_response :found
    assert_redirected_to root_path
  end

  test "ログイン失敗" do
    user = users(:user1)
    invalid_params = {"auth" => {"email"=> "sample1@example.com", "password" => "xxxxxx"}}
    post auths_url(invalid_params)
    assert_response :found
    assert_redirected_to new_auths_path
  end

  test 'delete' do
    user = users(:user1)

    params = {"auth" => {"email"=> user.email, "password" => user.password}}
    delete auths_url(params)
    
    assert_response :found
    assert_redirected_to new_auths_path
  end

end
