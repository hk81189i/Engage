class CreateTempfixes < ActiveRecord::Migration
  def change
    create_table :tempfixes do |t|
      t.string :infu_owner_id
      t.string :infu_id
      t.datetime :date

      t.timestamps
    end
  end
end
