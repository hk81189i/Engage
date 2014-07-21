class AddSellingPriceToPplan < ActiveRecord::Migration
  def change
    add_column :pplans, :selling_price, :integer
  end
end
