class Transaction < ApplicationRecord
  belongs_to :account

  default_scope {order('transaction_date')}

  validates_presence_of :transaction_date, :amount
end
