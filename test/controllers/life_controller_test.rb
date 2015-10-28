require 'test_helper'

class LifeControllerTest < ActionController::TestCase
  test "should get life_view" do
    get :life_view
    assert_response :success
  end

end
