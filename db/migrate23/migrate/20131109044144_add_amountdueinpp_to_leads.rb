class AddAmountdueinppToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :amountdueinpp, :integer
  end
end
