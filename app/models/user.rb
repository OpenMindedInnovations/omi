class User < ActiveRecord::Base
  acts_as_voter
  acts_as_marker

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
