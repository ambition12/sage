require 'test_helper'

class GraphRaderControllerTest < ActionController::TestCase
  test "should get status_view_rader" do
    get :status_view_rader
    assert_response :success
  end

end
