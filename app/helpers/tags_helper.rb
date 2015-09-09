module TagsHelper
  def parse_name(name)
    name.gsub("-", " ")
  end
end
