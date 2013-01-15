class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |p|
      p.string :title
      p.integer :user_id

      p.integer :genre
      p.string :name
      p.integer :pages
      p.integer :notes
      p.string :resume

      p.timestamps
    end
    add_index :publications, [:user_id, :created_at]
  end
end
