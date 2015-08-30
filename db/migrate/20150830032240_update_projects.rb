class UpdateProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :title, :name
    add_column :projects, :status, :string
    add_column :projects, :is_public, :boolean, default: false
    add_column :projects, :category, :string
    add_column :projects, :user_id, :integer
  end
end
