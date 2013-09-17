require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "can create user" do
    user = User.new
    user.name = Faker::Name.name
    user.email = Faker::Internet.email
    user.business_email = Faker::Internet.email
    user.image = Faker::Internet.url
    user.provider = "twitter"
    user.uid = "12345"
    assert user.save
  end

  test "can not create user without business_email" do
    user = User.new
    user.name = Faker::Name.name
    user.email = Faker::Internet.email
    user.image = Faker::Internet.url
    user.provider = "twitter"
    user.uid = "12345"
    refute user.save
  end

end
