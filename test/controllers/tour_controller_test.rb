require 'test_helper'

class TourControllerTest < ActionController::TestCase
  test "should get tour_view" do
    get :tour_view
    assert_response :success
  end

end
