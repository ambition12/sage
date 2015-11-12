require 'test_helper'

class FrendSearchControllerTest < ActionController::TestCase
  test "should get search_view" do
    get :search_view
    assert_response :success
  end

end
