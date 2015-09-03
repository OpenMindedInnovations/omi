class Blog < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  acts_as_taggable_on :tags

  validates_presence_of :title, :content

  self.per_page = 6
end
