class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  
  mount_uploader :image, ImageUploader
end
