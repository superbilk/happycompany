require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  def setup
    OmniAuth.config.add_mock(:xing)
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:xing]
  end

  test "should create account" do
    assert_difference 'User.count' do
      get :create
    end
  end

  test "should login existing user" do
    get :create
    get :destroy
    assert_no_difference 'User.count' do
      get :create
    end
  end

  test "should login user and has session" do
    assert_nil session[:user_id]
    get :create
    refute_nil session[:user_id]
  end

  test "logout should destroy session" do
    assert_nil session[:user_id]
    get :create
    get :destroy
    assert_nil session[:user_id]
  end

  test "should update username with login" do
    get :create
    get :destroy

    OmniAuth.config.add_mock(:xing, {:info => { :name => "Peter Pansen neu" } })
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:xing]

    get :create, :provider => "xing"
    assert_equal "Peter Pansen neu", User.find_by_id(session[:user_id]).name
  end

  # test "should not create account with gmail.com business_email" do
  #   OmniAuth.config.add_mock(:xing, {:extra => {
  #                                      :raw_info => {
  #                                        :business_address => {
  #                                          :email => "example@gmail.com" } } } } )
  #   request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:xing]

  #   assert_difference 'User.count', 0 do
  #     get :create, :provider => "xing"
  #   end
  # end

end
