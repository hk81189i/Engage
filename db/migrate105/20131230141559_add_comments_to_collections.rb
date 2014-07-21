class AddCommentsToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :comments, :text
  end
end
