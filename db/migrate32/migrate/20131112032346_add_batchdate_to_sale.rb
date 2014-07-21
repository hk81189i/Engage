class AddBatchdateToSale < ActiveRecord::Migration
  def change
    add_column :sales, :batchdate, :Date
  end
end
