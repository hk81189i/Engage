class AddUserIdToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :user_id, :string
  end
end
