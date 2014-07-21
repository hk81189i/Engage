class AddApproveToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :approve, :string
  end
end
