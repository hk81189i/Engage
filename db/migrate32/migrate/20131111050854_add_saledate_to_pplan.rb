class AddSaledateToPplan < ActiveRecord::Migration
  def change
    add_column :pplans, :saledate, :date
  end
end
