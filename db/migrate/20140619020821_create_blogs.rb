class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.text :video
      t.references :author, index: true

      t.timestamps
    end
  end
end
