class AddEmailToSales < ActiveRecord::Migration
  def change
    add_column :sales, :email, :string
  end
end
