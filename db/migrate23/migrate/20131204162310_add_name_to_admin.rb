class AddNameToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :, :name
  end
end
