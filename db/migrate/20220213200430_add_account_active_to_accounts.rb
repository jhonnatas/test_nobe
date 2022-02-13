class AddAccountActiveToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :account_active, :boolean
  end
end
