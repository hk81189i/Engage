class AddCommentsToSales < ActiveRecord::Migration
  def change
    add_column :sales, :comments, :text
  end
end
