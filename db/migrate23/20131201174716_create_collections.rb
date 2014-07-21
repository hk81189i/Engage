class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.date :date
      t.integer :amount
      t.integer :user_id
      t.integer :sale_id

      t.timestamps
    end
  end
end
