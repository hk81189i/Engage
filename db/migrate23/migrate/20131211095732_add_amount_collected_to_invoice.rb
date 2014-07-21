class AddAmountCollectedToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :amount_collected, :string
  end
end
