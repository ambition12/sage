require 'test_helper'

class EntameControllerTest < ActionController::TestCase
  test "should get entame_view" do
    get :entame_view
    assert_response :success
  end

end
