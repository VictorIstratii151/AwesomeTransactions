class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|

      t.decimal :amount, precision: 8, scale: 2
      t.string :description
      t.currency :string
      t.datetime :transaction_date
      t.belongs_to :account
      t.timestamps
    end
  end
end
