class RenameTypeToTrTypeInAccountTransactions < ActiveRecord::Migration[6.1]
  def change
    rename_column :account_transactions, :type, :tr_type
  end
end
