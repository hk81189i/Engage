class CreateCashtables < ActiveRecord::Migration
  def change
    create_table :cashtables do |t|
      t.string :year
      t.string :jan
      t.string :feb
      t.string :mar
      t.string :apr
      t.string :may
      t.string :jun
      t.string :july
      t.string :aug
      t.string :sept
      t.string :oct
      t.string :nov
      t.string :dec
      t.integer :lead_id
      t.integer :bdm_id

      t.timestamps
    end
  end
end
