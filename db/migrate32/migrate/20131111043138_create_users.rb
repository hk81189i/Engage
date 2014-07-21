class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :bdm_id
      t.date :saledate
      t.integer :selling_price
      t.integer :token

      t.timestamps
    end
  end
end
