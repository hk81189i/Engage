class AddCurrentSignInIpToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :current_sign_in_ip, :string
  end
end
