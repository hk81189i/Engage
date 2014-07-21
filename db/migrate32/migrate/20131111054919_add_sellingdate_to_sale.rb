class AddSellingdateToSale < ActiveRecord::Migration
  def change
    add_column :sales, :sellingdate, :date
  end
end
