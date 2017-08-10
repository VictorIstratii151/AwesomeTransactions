require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test "creating a ghost account" do
    account = Account.new
    assert_not account.save, "Saved account with no name or smth"
  end
end
