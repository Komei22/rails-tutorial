require 'test_helper'

class UsersHelperTest < ActionView::TestCase

  def setup
    @user = users(:michael)
  end

  test "gravatar image size should change 50" do
    img_tag = gravatar_for(@user, size: 50)
    assert_match "s=50", img_tag
  end
end
