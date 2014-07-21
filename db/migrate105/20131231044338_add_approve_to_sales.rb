class AddApproveToSales < ActiveRecord::Migration
  def change
    add_column :sales, :approve, :string
  end
end
