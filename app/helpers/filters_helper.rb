module FiltersHelper
  def parse_name(name)
    name.gsub("-", " ")
  end

  def filter_section_generate(generate_params, generate_links, hash_key)
    
    generate_params = generate_params.downcase.split(' ')
    current_params = params.clone
    generate_links.each do |link|
      if generate_params.include?(link)
        state = generate_params - [link]
        state.empty? ? current_params.delete(hash_key) : current_params[hash_key] = state.join(' ')
        concat link_to( parse_name(link), (current_params), { class: 'btn btn-success' } )
      else
        if hash_key == :status
          current_params[hash_key] = link
        elsif hash_key == :sort
          current_params[hash_key] = link
        else 
          state = generate_params + [link]
          current_params[hash_key] = state.join(' ')
        end
        concat link_to( parse_name(link), (current_params), { class: 'btn btn-default' } )
      end
    end
  end
end