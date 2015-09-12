class Blog < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  acts_as_taggable_on :tags

  validates_presence_of :title, :content

  self.per_page = 6

  scope :ordered_tags, -> { tag_counts.order(taggings_count: :desc).pluck(:name).map { |t| t.gsub(" ", "-")} }

  def self.sort_filter(sort_param)
    case sort_param
    when 'oldest'
      order(created_at: :asc)
    when 'newest'
      order(created_at: :desc)
    else
      order(created_at: :asc)
    end
  end
end