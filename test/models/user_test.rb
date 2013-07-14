require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "can create user" do
    user = User.new
    user.name = Faker::Name.name
    user.email = Faker::Internet.email
    user.image_mini_thumb = Faker::Internet.url
    assert user.save
  end

end
