class AddRememberCreatedAtToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :remember_created_at, :string
  end
end
