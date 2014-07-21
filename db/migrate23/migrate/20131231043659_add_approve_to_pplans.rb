class AddApproveToPplans < ActiveRecord::Migration
  def change
    add_column :pplans, :approve, :string
  end
end
