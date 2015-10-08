module ApplicationHelper
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end

  def is_admin
    if current_user
      if current_user.admin
        return true
      else
        return false
      end
    else
      return false
    end
  end
      
  def markdown(text)
    options = {
      autolink: true,
      space_after_header: true,
      strikethrough: true,
      quote: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      superscript: true
    }
    renderer = HTMLwithPygments.new({
      filter_html: true,
      hard_wrap: true,
      safe_links_only: true
      })
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  def body_classes
    qualified_controller_name = controller.controller_path.gsub('/','-')
    basic_body_class = "#{qualified_controller_name.gsub('_', '-')} #{qualified_controller_name.gsub('_', '-')}-#{controller.action_name}"
    basic_body_class
  end

  def page_javascript(*files)
    content_for(:page_specific_js) { javascript_include_tag(*files) }
  end

  def gravatar?(user)
    gravatar_check = "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email.downcase)}.png?d=404"
    uri = URI.parse(gravatar_check)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    response.code.to_i != 404 # from d=404 parameter
  end

  def avatar_for(user)
    if gravatar?(user)
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
      image_tag(gravatar_url, alt: user.full_name, class: "avatar")
    else
      image_tag('avatar_placeholder.png')
    end
  end
end


