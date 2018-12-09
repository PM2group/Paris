require 'test_helper'

class ChatPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get chat_pages_show_url
    assert_response :success
  end

  test "should get new" do
    get chat_pages_new_url
    assert_response :success
  end

  test "should get create" do
    get chat_pages_create_url
    assert_response :success
  end

end
