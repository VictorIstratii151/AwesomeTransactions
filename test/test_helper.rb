require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

module SignInDevise
  def sign_in(user)
    post user_session_path \
      "user[email]" => user.email,
      "user[password]" => user.password
  end
end


class ActiveSupport::TestCase

  # include Devise::Test::ControllerHelpers

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include SignInDevise
end

