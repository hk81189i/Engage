class AddTokenToPplan < ActiveRecord::Migration
  def change
    add_column :pplans, :token, :integer
  end
end
