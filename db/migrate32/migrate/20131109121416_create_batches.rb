class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.date :date
      t.text :batch_name

      t.timestamps
    end
  end
end
