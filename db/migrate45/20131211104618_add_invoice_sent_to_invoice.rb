class AddInvoiceSentToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :invoice_sent, :integer
  end
end
