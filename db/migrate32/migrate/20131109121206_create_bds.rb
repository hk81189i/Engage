class CreateBds < ActiveRecord::Migration
  def change
    create_table :bds do |t|
      t.string :name

      t.timestamps
    end
  end
end
