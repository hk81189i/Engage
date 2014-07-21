class AddReferalCodeToSales < ActiveRecord::Migration
  def change
    add_column :sales, :referal_code, :string
  end
end
