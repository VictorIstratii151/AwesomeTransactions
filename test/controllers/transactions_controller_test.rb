require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(email: "les@example.com", password: "secret123")
    sign_in @user

    @account = @user.accounts.create(name: "random account", currency_id: currencies(:eur).id, balance: 0.0)
  end


  test "should create a new transaction" do
    assert_difference '@account.transactions.count' do
      post transactions_path,
        params: {
          transaction: {
            amount: 123.34,
            description: "heh",
            transaction_date: Time.now,
            account_id: @account.id
          }
        }

      assert_response :created
    end

    transaction = @account.transactions.last

    assert_equal 123.34, transaction.amount
    assert_equal "heh", transaction.description
    assert_equal @account.id, transaction.account_id
  end


  test "should return all the transactions associated with account" do
    get transactions_path

    assert_response :ok
  end
end
