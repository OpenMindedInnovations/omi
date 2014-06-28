module ApplicationHelper
  def youtube_video(video)
    render :partial => 'shared/video', :locals => { :video => video }
  end

  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
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
end


