class Project < ActiveRecord::Base
  extend Enumerize
  extend FriendlyId

  acts_as_taggable_on :tags

  markable_as :favorite

  belongs_to :user

  friendly_id :name, use: [:slugged, :finders]

  enumerize :category, in: [:personal, :contract, :product, :open_source], predicates: true, scope: true
  enumerize :status, in: [:active, :inactive, :completed, :new], predicates: true, scope: true

  validates_presence_of :category, :status, :name, :description

  mount_uploader :image, ImageUploader

  def self.sort_filter(sort_param)
    case sort_param
    when "most-favorites"
      marked_as_favorite.order(:count).reverse
    when "least-favorites"
      marked_as_favorite.order(:count)
    when "oldest"
      order(created_at: :asc)
    when "newest"
      order(created_at: :desc)
    end
  end
end
