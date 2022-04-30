class AddColumnsToAdminUser < ActiveRecord::Migration[7.0]
  def change
    add_column(:admin_users, :first_name, :string, default: '')
    add_column(:admin_users, :last_name, :string, default: '')
  end
end
