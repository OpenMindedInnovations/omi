class Project < ActiveRecord::Base
  extend Enumerize
  extend FriendlyId

  acts_as_taggable

  markable_as :favorite

  belongs_to :user

  friendly_id :name, use: [:slugged, :finders]

  enumerize :category, in: [:personal, :contract, :product, :open_source], predicates: true, scope: true
  enumerize :status, in: [:active, :inactive, :completed, :new], predicates: true, scope: true

  validates_presence_of :category, :status, :name, :description

  mount_uploader :image, ImageUploader
end
