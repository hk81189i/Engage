class AddPplanIdToTemp < ActiveRecord::Migration
  def change
    add_column :temps, :pplan_id, :integer
  end
end
