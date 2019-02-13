require 'test_helper'

class GenerationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get generations_index_url
    assert_response :success
  end

  test "should get show" do
    get generations_show_url
    assert_response :success
  end

end
