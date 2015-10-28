require 'test_helper'

class GourmetControllerTest < ActionController::TestCase
  test "should get gourmet_view" do
    get :gourmet_view
    assert_response :success
  end

end
