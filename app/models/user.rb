class User < ActiveRecord::Base
  acts_as_voter
  acts_as_marker
  acts_as_taggable_on :skills, :roles

  Roles = ["Student", "Mentor"]
  Skills =  ["Business Development", "Data Science", "Engineering",
              "Front End", "Back End", "FullStack", "Mobile", "Biomedical",
              "Electrical", "Mechanical", "Sales", "Fundraising", "Growth",
              "Marketing", "Operations", "Product", "UI/Design", "Industrial", "Other"]
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects
  has_many :ideas

  validates_presence_of :first_name, :last_name

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}".strip
  end
end
