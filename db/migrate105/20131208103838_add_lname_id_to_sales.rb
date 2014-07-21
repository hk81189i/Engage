class AddLnameIdToSales < ActiveRecord::Migration
  def change
    add_column :sales, :lname, :string
  end
end
