class AddSaleDateToLead < ActiveRecord::Migration
  def change
    add_column :leads, :saledate, :date
  end
end
