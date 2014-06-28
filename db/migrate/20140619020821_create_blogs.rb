class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.references :author, index: true

      t.string :title
      t.text :content

      t.string :embed_id

      t.timestamps
    end
  end
end
