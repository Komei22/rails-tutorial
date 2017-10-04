require 'test_helper'

class UsersUserInfoTestTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "get user information" do
    get profile_user_path(@user)
    assert_match "id", response.body
    assert_match "name", response.body
    assert_match "img_url", response.body
  end
end
