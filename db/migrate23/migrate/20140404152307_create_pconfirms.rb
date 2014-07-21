class CreatePconfirms < ActiveRecord::Migration
  def change
    create_table :pconfirms do |t|
      t.string :name
      t.string :email
      t.integer :phone

      t.timestamps
    end
  end
end
