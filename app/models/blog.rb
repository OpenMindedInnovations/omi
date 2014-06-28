class Blog < ActiveRecord::Base
  belongs_to :author
  has_many :taggings
  has_many :tags, through: :taggings

  validates_presence_of :title, :content

  def self.tagged_with(name)
    Tag.find_by_name!(name).blogs 
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
