require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  def sign_in(user)
    post user_session_path \
      "user[email]" => user.email,
      "user[password]" => user.password
  end

  def setup
    @user = User.create(email: "les@example.com", password: Devise::Encryptor.digest(User, "secret123"))
    sign_in @user
  end

  test "should create account" do
    assert_difference 'Account.count' do
      post accounts_path,
      params: {
        account: {
          name:     "test account",
          currency_id: 1,
          balance:  0.0
        }
      }
    end
  end
end
