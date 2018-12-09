require 'test_helper'

class SessionsComControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sessions_com_new_url
    assert_response :success
  end

end
