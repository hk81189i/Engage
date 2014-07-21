class AddAdminNameToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :admin_name, :string
  end
end
