class CreateAccountTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :account_transactions do |t|
      t.date :date
      t.string :description, limit: 80
      t.string :doc_ref,     limit: 20
      t.string :type,        limit: 1
      t.decimal :amount,     precision: 12, scale: 2
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
