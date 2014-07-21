class AddTransformationsToPconfirm < ActiveRecord::Migration
  def change
    add_column :pconfirms, :transformations, :string
  end
end
