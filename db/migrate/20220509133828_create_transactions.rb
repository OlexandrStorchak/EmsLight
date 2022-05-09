class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :author_id
      t.string :description
      t.timestamp :occured_at
      t.integer :agent_id
      t.integer :category_id
      t.integer :project_id
      t.integer :debit_account_id
      t.integer :credit_account_id
      t.integer :debit_amount
      t.integer :credit_amount
    end
    add_index :transactions, :occured_at
    add_index :transactions, :debit_amount
    add_index :transactions, :credit_amount
  end
end
