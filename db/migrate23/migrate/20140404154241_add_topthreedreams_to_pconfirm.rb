class AddTopthreedreamsToPconfirm < ActiveRecord::Migration
  def change
    add_column :pconfirms, :topthreedreams, :string
  end
end
