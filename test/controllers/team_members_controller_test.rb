require 'test_helper'

class TeamMembersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get team_members_index_url
    assert_response :success
  end

  test "should get show" do
    get team_members_show_url
    assert_response :success
  end

end
