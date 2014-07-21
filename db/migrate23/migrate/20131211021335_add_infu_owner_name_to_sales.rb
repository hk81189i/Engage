class AddInfuOwnerNameToSales < ActiveRecord::Migration
  def change
    add_column :sales, :infu_owner_name, :string
  end
end
