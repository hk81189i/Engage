class AddBatchdateToSales < ActiveRecord::Migration
  def change
    add_column :sales, :batchdate, :date
  end
end
