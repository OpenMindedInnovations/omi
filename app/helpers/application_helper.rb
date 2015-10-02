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
end


