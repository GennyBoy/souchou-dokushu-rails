require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "名前が必須" do
    user1 = users(:user1)
    user1.name = ""
    user1.valid?
    assert user1.errors.messages[:name].include?("を入力してください")
  end

  test "eメールが必須" do
    user1 = users(:user1)
    user1.email = ""
    user1.valid?
    assert user1.errors.messages[:email].include?("を入力してください")
  end

  test "パスワードが必須" do
    user1 = users(:user1)
    user1.password = ""
    user1.valid?
    assert user1.errors.messages[:password].include?("を入力してください")
  end

  test "eメールがユニークである" do
    user1 = users(:user1)
    user2 = users(:user2)
    user1.email = "sample2@example.com"
    user1.valid?
    assert user1.errors.messages[:email].include?("はすでに存在します")
  end

  test "Login バリデーション空属性検証" do
    auth = Auth.new(email: '', password: '') # バリデーションを評価する
    auth.valid?
    assert_empty auth.email
    assert_empty auth.password
    assert_equal 2, auth.errors.count
  end
end
