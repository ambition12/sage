require 'test_helper'

class SageControllerTest < ActionController::TestCase
  test "should get top" do
    get :top
    assert_response :success
  end

end
