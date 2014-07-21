class AddPplanCompleteToPplan < ActiveRecord::Migration
  def change
    add_column :pplans, :pplan_complete, :string
  end
end
