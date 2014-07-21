class AddSaledateToPplan < ActiveRecord::Migration
  def change
    add_column :pplans, :saledate, :Date
  end
end
