require 'test_helper'

class MicropostsCreateTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "show json when micropost create" do
    content = "hogehoge"
    assert_difference 'Micropost.count', 1 do
      post microposts_create_path, params: { user_id: @user.id, micropost: { content: content} }
    end
    assert_match "micropost", response.body
    assert_match "id", response.body
    assert_match "content", response.body
    assert_match "user_id", response.body
    assert_match "created_at", response.body
    assert_match "updated_at", response.body
    assert_match "picture", response.body
  end

  test "show error json when micropost could not saved" do
    content = "hoge" * 50
    assert_no_difference 'Micropost.count' do
      post microposts_create_path, params: { user_id: @user.id, micropost: { content: content} }
    end
    assert_match "error", response.body
    assert_match "message", response.body
    assert_match "code", response.body
    assert_match "500", response.body
  end

  test "show error json when user is not found" do
    content = "hoge"
    assert_no_difference 'Micropost.count' do
      post microposts_create_path, params: { user_id: 1000, micropost: { content: content} }
    end
    assert_match "error", response.body
    assert_match "message", response.body
    assert_match "code", response.body
    assert_match "404", response.body
  end
end
