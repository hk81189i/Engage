class AddBdmidToLead < ActiveRecord::Migration
  def change
    add_column :leads, :bdmid, :string
  end
end
