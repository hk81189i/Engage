class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :user_id
      t.integer :sale_id
      t.integer :batch_id
      t.integer :bd_id

      t.timestamps
    end
  end
end
