require 'test_helper'

class MecabControllerTest < ActionController::TestCase
  test "should get nouncount" do
    get :nouncount
    assert_response :success
  end

end
