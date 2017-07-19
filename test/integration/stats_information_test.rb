require 'test_helper'

class StatsInformationTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "profile page show stats information " do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'a[href=?]', following_user_path(@user)
    assert_match @user.following.count.to_s, response.body
    assert_select 'a[href=?]', followers_user_path(@user)
    assert_match @user.followers.count.to_s, response.body
  end

  test "home page show stas information" do
    log_in_as(@user)
    get root_path
    assert_select 'a[href=?]', following_user_path(@user)
    assert_match @user.following.count.to_s, response.body
    assert_select 'a[href=?]', followers_user_path(@user)
    assert_match @user.followers.count.to_s, response.body
  end
end
