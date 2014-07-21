class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email
      t.text :batch
      t.integer :phone
      t.string :selling_price
      t.string :token
      t.integer :balance

      t.timestamps
    end
  end
end
