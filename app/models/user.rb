class User < ActiveRecord::Base
  acts_as_voter
  acts_as_marker
  acts_as_taggable_on :skills, :roles

  @roles = ["student", "mentor"]
  @skills =  ["business development", "data science", "engineering", "front end", "back end", "fullstack", "mobile", "biomedical", "electrical", "mechanical", "sales", "fundraising", "growth", "marketing", "operations", "product", "ui/design", "industrial", "other"]
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects
  has_many :ideas

  validates_presence_of :first_name, :last_name

  def self.list_of_skills
    @skills
  end

  def self.list_of_roles
    @roles
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}".strip
  end
end
