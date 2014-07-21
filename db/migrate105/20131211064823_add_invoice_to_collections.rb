class AddInvoiceToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :invoice, :string
  end
end
