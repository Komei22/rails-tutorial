require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:archer)
    @non_activated_user = users(:lana)
  end

  test "show should display root_url when non-activated user" do
    log_in_as(@user)
    get user_path(@non_activated_user)
    assert_redirected_to root_url
  end
end
