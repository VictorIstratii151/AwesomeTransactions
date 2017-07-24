class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|

      t.string :name
      t.string :currency
      t.decimal :balance, precision: 8, scale: 2
      t.belongs_to :user
      t.timestamps
    end
  end
end
