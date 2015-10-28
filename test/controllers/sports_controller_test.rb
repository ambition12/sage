require 'test_helper'

class SportsControllerTest < ActionController::TestCase
  test "should get sports_view" do
    get :sports_view
    assert_response :success
  end

end
