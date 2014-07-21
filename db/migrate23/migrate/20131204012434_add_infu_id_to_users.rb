class AddInfuIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :infu_id, :string
  end
end
