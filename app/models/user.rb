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

  def self.list_of_tags(name, parse=false)
    case name
    when "skills"
      list = @skills
    when "roles"
      list = @roles
    end

    if parse == true
      list.map { |item| item.gsub(" ", "-") }
    else
      list
    end 
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}".strip
  end

  def self.sort_filter(sort_param)
    case sort_param
    when "oldest"
      order(created_at: :asc)
    when "newest"
      order(created_at: :desc)
    else
      order(created_at: :asc)
    end
  end
end
