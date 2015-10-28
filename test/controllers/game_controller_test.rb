require 'test_helper'

class GameControllerTest < ActionController::TestCase
  test "should get game_view" do
    get :game_view
    assert_response :success
  end

end
