class Idea < ActiveRecord::Base
  acts_as_votable
  acts_as_taggable_on :tags

  belongs_to :user
  has_many :comments, as: :commentable

  validates_presence_of :name, :description

  scope :ordered_tags, ->  { tag_counts.order(taggings_count: :desc).pluck(:name).map { |t| t.gsub(" ", "-")} }

  def self.sort_filter(sort_param)
    case sort_param.downcase
    when "votes-up"
      order(cached_votes_up: :desc)
    when "votes-down"
      order(cached_votes_up: :asc)
    when "oldest"
      order(created_at: :asc)
    when "newest"
      order(created_at: :desc)
    else
      order(created_at: :asc)
    end
  end
end
