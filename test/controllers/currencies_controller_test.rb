require 'test_helper'

class CurrenciesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(email: "les@example.com", password: "secret123")
    sign_in @user
    @currencies = Currency.all
  end

  test "should return all the currencies" do
    get '/api/currencies.json'
    assert_response :ok
  end
end
