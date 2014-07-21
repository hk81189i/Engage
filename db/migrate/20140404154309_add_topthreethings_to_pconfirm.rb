class AddTopthreethingsToPconfirm < ActiveRecord::Migration
  def change
    add_column :pconfirms, :topthreethings, :string
  end
end
