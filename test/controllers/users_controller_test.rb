require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get show_company" do
    get :show_company
    assert_response :success
  end

end
