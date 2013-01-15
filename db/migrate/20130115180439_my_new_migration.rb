class MyNewMigration < ActiveRecord::Migration
  def change
    add_column :publications, :genre, :integer
    remove_column :publications, :type
  end
end
