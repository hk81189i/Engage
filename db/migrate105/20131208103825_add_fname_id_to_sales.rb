class AddFnameIdToSales < ActiveRecord::Migration
  def change
    add_column :sales, :fname, :string
  end
end
