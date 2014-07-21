class AddModeToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :mode, :string
  end
end
