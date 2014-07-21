class CreateTemps < ActiveRecord::Migration
  def change
    create_table :temps do |t|
      t.date :date
      t.integer :amount
      t.integer :pplan_id

      t.timestamps
    end
  end
end
