class AddSignInCountToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :sign_in_count, :string
  end
end
