ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:default] = OmniAuth::AuthHash.new({
    'provider' => 'xing',
    'uid' => '99123545',
    'info' => {
      'name' => "Peter Pansen",
      'email' => "pansen@example.com"
    },
    'extra' => {
      'raw_info' => {
        'photo_urls' => {
          'mini_thumb' => "image.png"
        },
        'business_address' => {
          'email' => "company@example.com"
        }
      }
    }
  })

end
