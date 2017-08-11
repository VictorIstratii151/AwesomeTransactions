require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(email: "les@example.com", password: "secret123")
    sign_in @user

    @account = @user.accounts.create(name: "random account", currency_id: currencies(:eur).id, balance: 0.0)
  end



  test "should create account" do
    assert_difference '@user.accounts.count' do
      post accounts_path,
        params: {
          account: {
            name:     "test account",
            currency_id: currencies(:eur).id,
            balance:  0.0
          }
        }

      assert_response :created
    end

    account = @user.accounts.last
    assert_equal 'test account', account.name
    assert_equal currencies(:eur), account.currency
    assert_equal 0.0, account.balance
  end


  test "should return current user's accounts" do
    get accounts_path
    accounts = JSON.parse(response.body)

    accounts.each do |account|
      assert_equal account["user_id"], @user.id
    end
  end


  test "should show account" do

    get "/api/accounts/#{@account.id}"

    assert_response :ok
  end

  test "should destroy account" do

    assert_difference('@user.accounts.count', -1) do
      delete "/api/accounts/#{@account.id}"

      assert_response :no_content
    end
  end


  test "should update account" do
    patch "/api/accounts/#{@account.id}", params: { account: { name: "updated account name" } }

    assert_response :no_content
    # Reload association to fetch updated data and assert that name is updated.

    @account.reload
    assert_equal "updated account name", @account.name
  end

end
