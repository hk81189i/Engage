class AddInvoiceIdToPplans < ActiveRecord::Migration
  def change
    add_column :pplans, :invoice_id, :string
  end
end
