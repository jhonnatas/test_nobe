class AddDefaultValueToAmountAttribute < ActiveRecord::Migration[6.1]
  def change
    change_column :account_transactions, :amount, :decimal, default: 0.00
  end
end
