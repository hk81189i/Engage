class AddInfuOwnerIdToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :infu_owner_id, :string
  end
end
