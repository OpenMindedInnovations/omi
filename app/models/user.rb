class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  after_create :get_avatar

  acts_as_voter
  acts_as_marker
  acts_as_taggable_on :skills, :roles

  @roles = ["Student", "Mentor"]
  @skills =  ["Business Development", "Data Science", "Engineering", "Front End", "Back End", "Fullstack", "Mobile", "Biomedical", "Electrical", "Mechanical", "Sales", "Fundraising", "Growth", "Marketing", "Operations", "Product", "UI/UX", "Industrial", "Other"]
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ideas
  has_many :teams
  has_many :projects, through: :teams

  validates_presence_of :first_name, :last_name
  # validates_presence_of   :avatar
  # validates_integrity_of  :avatar
  # validates_processing_of :avatar

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

  def self.parse_for_params(arr)
    arr.map { |item| item.gsub(" ", "-") }
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}".strip
  end

  def self.sort_filter(sort_param)
    case sort_param.downcase
    when "oldest"
      order(created_at: :asc)
    when "newest"
      order(created_at: :desc)
    else
      order(created_at: :asc)
    end
  end

  def gravatar_check?(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_check = "http://gravatar.com/avatar/#{gravatar_id}.png?d=404"
    uri = URI.parse(gravatar_check)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    response.code.to_i != 404 # from d=404 parameter
  end
  
  def get_avatar
    user = self
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    if gravatar_check?(user)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=300"
      user.remote_avatar_url = gravatar_url
      user.save
    else
      placeholder = File.open(Rails.root + "public/images/avatar_placeholder.png")
      user.avatar = placeholder
      user.save
    end
  end
end
