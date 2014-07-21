class AddBatchIdToPplan < ActiveRecord::Migration
  def change
    add_column :pplans, :batch_id, :integer
  end
end
