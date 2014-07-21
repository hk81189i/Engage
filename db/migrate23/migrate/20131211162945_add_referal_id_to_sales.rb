class AddReferalIdToSales < ActiveRecord::Migration
  def change
    add_column :sales, :referal_id, :string
  end
end
