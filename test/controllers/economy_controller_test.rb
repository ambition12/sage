require 'test_helper'

class EconomyControllerTest < ActionController::TestCase
  test "should get economy_view" do
    get :economy_view
    assert_response :success
  end

end
