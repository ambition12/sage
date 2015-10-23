require 'test_helper'

class GraphControllerTest < ActionController::TestCase
  test "should get status_view" do
    get :status_view
    assert_response :success
  end

end
