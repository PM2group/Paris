require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get company" do
    get search_company_url
    assert_response :success
  end

end
