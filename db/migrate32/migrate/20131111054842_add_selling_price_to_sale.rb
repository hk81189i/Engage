class AddSellingPriceToSale < ActiveRecord::Migration
  def change
    add_column :sales, :selling_price, :integer
  end
end
