class AddInvoiceIdToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :invoice_id, :string
  end
end
