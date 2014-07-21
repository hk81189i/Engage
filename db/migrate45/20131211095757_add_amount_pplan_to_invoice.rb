class AddAmountPplanToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :amount_pplan, :string
  end
end
