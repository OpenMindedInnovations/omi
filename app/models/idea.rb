class Idea < ActiveRecord::Base
  acts_as_votable
  acts_as_taggable_on :tags

  belongs_to :user

  validates_presence_of :name, :description

  def self.sort_filter(sort_param)
    case sort_param
    when "votes-up"
      order(cached_votes_up: :desc)
    when "votes-down"
      order(cached_votes_up: :asc)
    when "oldest"
      order(created_at: :asc)
    when "newest"
      order(created_at: :desc)
    end
  end
end
