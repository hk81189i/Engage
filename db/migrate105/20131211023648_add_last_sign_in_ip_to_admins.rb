class AddLastSignInIpToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :last_sign_in_ip, :string
  end
end
