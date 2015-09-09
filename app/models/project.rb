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

  scope :ordered_tags, -> { tag_counts.order(taggings_count: :desc).pluck(:name).map { |t| t.gsub(" ", "-")} }

  def self.sort_filter(sort_param)
    case sort_param
    when "most-favorited"
      marked_as_favorite.order(:count).reverse
    when "least-favorited"
      marked_as_favorite.order(:count)
    when "oldest"
      order(created_at: :asc)
    when "newest"
      order(created_at: :desc)
    end
  end
end
