class AddTokenToSale < ActiveRecord::Migration
  def change
    add_column :sales, :token, :integer
  end
end
