class AddAmountinppToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :amountinpp, :integer
  end
end
