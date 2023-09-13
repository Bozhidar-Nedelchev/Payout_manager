class AddSalesRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :sales_role, :boolean
  end
end
