class Project < ActiveRecord::Base
  extend Enumerize
  extend FriendlyId

  acts_as_taggable_on :tags

  markable_as :favorite

#  belongs_to :user
  has_many :teams
  has_many :users, through: :teams
  accepts_nested_attributes_for :teams

  friendly_id :name, use: [:slugged, :finders]

  enumerize :category, in: [:personal, :contract, :product, :open_source], predicates: true, scope: true
  enumerize :status, in: [:active, :inactive, :completed, :new], predicates: true, scope: true

  validates_presence_of :category, :status, :name, :description

  mount_uploader :image, ImageUploader

  scope :ordered_tags, -> { tag_counts.order(taggings_count: :desc).pluck(:name).map { |t| t.gsub(" ", "-")} }

  scope :status_list, -> { uniq.pluck(:status) }

  def self.status_filter(status_param)
    status = self.status_list
    if status.include?(status_param)
      where(status: status_param)
    else
      self.none
    end
  end

  def self.sort_filter(sort_param)
    case sort_param
    when "most-favorited"
      marked_as_favorite.order(count: :desc)
    when "least-favorited"
      marked_as_favorite.order(count: :asc)
    when "oldest"
      order(created_at: :asc)
    when "newest"
      order(created_at: :desc)
    else
      order(created_at: :asc)
    end
  end
end
