class AddCollectionCurrentToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :collection_current, :integer
  end
end
