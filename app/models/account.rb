class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy
  belongs_to :currency

  validates_presence_of :name, :currency, :balance
end
