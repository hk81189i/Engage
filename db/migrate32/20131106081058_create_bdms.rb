class CreateBdms < ActiveRecord::Migration
  def change
    create_table :bdms do |t|
      t.text :name
      t.text :email
      t.integer :phone

      t.timestamps
    end
  end
end
