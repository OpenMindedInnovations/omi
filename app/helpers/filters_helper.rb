module FiltersHelper
  def parse_name(name)
    name.gsub("-", " ")
  end

  def get_filter_params(params)
    params.delete(:controller) && params.delete(:action)
    if params.has_key?(:tags) || params.has_key?(:status) || params.has_key?(:sort)
      filter_params = params
    else
      params #in case there are other params that need to be preserved
    end
  end
end
