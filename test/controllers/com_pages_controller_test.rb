require 'test_helper'

class ComPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get com_pages_index_url
    assert_response :success
  end

  test "should get show" do
    get com_pages_show_url
    assert_response :success
  end

  test "should get new" do
    get com_pages_new_url
    assert_response :success
  end

  test "should get edit" do
    get com_pages_edit_url
    assert_response :success
  end

end
