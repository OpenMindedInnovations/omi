class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :author
      t.text :content
      t.string :slug, :null => false, :unique => true

      t.string :embed_id

      t.timestamps
    end
  end
end
