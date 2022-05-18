class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :description, null: false, default: ""
      t.timestamp :occured_at, null: false
    end

    add_reference :transactions, :author, type: :integer, index: true, foreign_key: { to_table: :admin_users }
    add_reference :transactions, :account, type: :integer, index: true, foreign_key: true
    add_reference :transactions, :agent, type: :integer, index: true, foreign_key: true
    add_reference :transactions, :category, type: :integer, index: true, foreign_key: true
    add_reference :transactions, :project, type: :integer, index: true, foreign_key: true
  end
end
