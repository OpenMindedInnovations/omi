class Team < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  accepts_nested_attributes_for :user
  validates_uniqueness_of :user_id, :scope => :project_id
end
