class ChangeProjectIsPublicToFeatured < ActiveRecord::Migration
  def change
    rename_column :projects, :is_public, :featured
  end
end
