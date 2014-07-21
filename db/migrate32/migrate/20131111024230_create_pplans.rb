class CreatePplans < ActiveRecord::Migration
  def change
    create_table :pplans do |t|
      t.date :paying_date
      t.integer :amount
      t.integer :user_id
      t.integer :sale_id

      t.timestamps
    end
  end
end
