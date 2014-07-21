class AddInfuIdToSales < ActiveRecord::Migration
  def change
    add_column :sales, :infu_id, :string
  end
end
