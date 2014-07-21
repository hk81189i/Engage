class AddInfuOwnerEmailToSales < ActiveRecord::Migration
  def change
    add_column :sales, :infu_owner_email, :string
  end
end
