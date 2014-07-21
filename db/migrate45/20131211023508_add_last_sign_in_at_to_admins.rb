class AddLastSignInAtToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :last_sign_in_at, :string
  end
end
