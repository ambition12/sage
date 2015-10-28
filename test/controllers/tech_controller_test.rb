require 'test_helper'

class TechControllerTest < ActionController::TestCase
  test "should get tech_view" do
    get :tech_view
    assert_response :success
  end

end
