class AddBalanceToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :balance, :decimal, precision: 10, scale: 2
  end
end
