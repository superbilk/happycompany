require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  def setup
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:xing]
  end

  test "should create account" do
    assert_difference 'User.count' do
      get :create, :provider => "xing"
    end
  end

  test "should login existing user" do
    get :create, :provider => "xing"
    get :destroy
    assert_no_difference 'User.count' do
      get :create, :provider => "xing"
    end
  end

  test "should login user and has session" do
    assert_nil session[:user_id]
    get :create, :provider => "xing"
    refute_nil session[:user_id]
  end

  test "logout should destroy session" do
    assert_nil session[:user_id]
    get :create, :provider => "xing"
    get :destroy
    assert_nil session[:user_id]
  end

end
