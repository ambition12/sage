require 'test_helper'

class AnimeControllerTest < ActionController::TestCase
  test "should get anime_view" do
    get :anime_view
    assert_response :success
  end

end
