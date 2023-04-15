require 'test_helper'

class AcceptancesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get acceptances_new_url
    assert_response :success
  end

  test "should get create" do
    get acceptances_create_url
    assert_response :success
  end

end
