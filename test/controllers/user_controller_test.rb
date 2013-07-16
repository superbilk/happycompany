require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get show_company" do
    get :show_company
    assert_response :success
  end

end
