# This migration comes from acts_as_taggable_on_engine (originally 1)
class ActsAsTaggableOnMigration < ActiveRecord::Migration
  def self.up
    ActiveRecord::Base.transaction do
      # GET EXISTING TAGS ON BLOGS
      blog_tags = []

      blogs = select_all('SELECT * FROM blogs')
      blogs.each do |blog|
        tag_names = select_values("SELECT name FROM tags INNER JOIN taggings ON tags.id = taggings.tag_id WHERE taggings.blog_id = #{blog['id']}")

        blog_tags << {id: blog['id'], tag_list: tag_names}
      end

      drop_table :taggings
      drop_table :tags
      # DROP EXISTING TABLES

      # ACTS AS TAGGABLE MIGRATION 1
      create_table :tags do |t|
        t.string :name
      end

      create_table :taggings do |t|
        t.references :tag

        # You should make sure that the column created is
        # long enough to store the required class names.
        t.references :taggable, polymorphic: true
        t.references :tagger, polymorphic: true

        # Limit is created to prevent MySQL error on index
        # length for MyISAM table type: http://bit.ly/vgW2Ql
        t.string :context, limit: 128

        t.datetime :created_at
      end

      add_index :taggings, :tag_id
      add_index :taggings, [:taggable_id, :taggable_type, :context]

      # ACTS AS TAGGABLE MIGRATION 2
      add_index :tags, :name, unique: true

      remove_index :taggings, :tag_id
      remove_index :taggings, [:taggable_id, :taggable_type, :context]
      add_index :taggings,
                [:tag_id, :taggable_id, :taggable_type, :context, :tagger_id, :tagger_type],
                unique: true, name: 'taggings_idx'

      # ACTS AS TAGGABLE MIGRATION 3
      add_column :tags, :taggings_count, :integer, default: 0

      ActsAsTaggableOn::Tag.reset_column_information
      ActsAsTaggableOn::Tag.find_each do |tag|
        ActsAsTaggableOn::Tag.reset_counters(tag.id, :taggings)
      end

      # ACTS AS TAGGABLE MIGRATION 4
      add_index :taggings, [:taggable_id, :taggable_type, :context]

      # ACTS AS TAGGABLE MIGRATION 5
      if ActsAsTaggableOn::Utils.using_mysql?
        execute("ALTER TABLE tags MODIFY name varchar(255) CHARACTER SET utf8 COLLATE utf8_bin;")
      end

      # ADD BLOG TAGS BACK USING ACTS AS TAGGABLE
      blog_tags.each do |blog|
        b = Blog.find(blog[:id])
        b.tag_list.add(blog[:tag_list])
        b.save
      end
    end
  end

  def self.down
    # ACTS AS TAGGABLE MIGRATION 1
    drop_table :taggings
    drop_table :tags

    # ACTS AS TAGGABLE MIGRATION 2
    remove_index :tags, :name

    remove_index :taggings, name: 'taggings_idx'
    add_index :taggings, :tag_id
    add_index :taggings, [:taggable_id, :taggable_type, :context]

    # ACTS AS TAGGABLE MIGRATION 3
    remove_column :tags, :taggings_count

    # ACTS AS TAGGABLE MIGRATION 4
    remove_index :taggings, [:taggable_id, :taggable_type, :context]
  end
end
