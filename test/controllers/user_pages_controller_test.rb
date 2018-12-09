require 'test_helper'

class UserPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_pages_index_url
    assert_response :success
  end

  test "should get show" do
    get user_pages_show_url
    assert_response :success
  end

  test "should get new" do
    get user_pages_new_url
    assert_response :success
  end

  test "should get edit" do
    get user_pages_edit_url
    assert_response :success
  end

end
