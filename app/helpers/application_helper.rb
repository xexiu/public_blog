module ApplicationHelper
  
  def indented_render(num, *args)
    render(*args).gsub("Add a Reply", "\t" * num).html_safe
  end
  
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div(:line_numbers => :table)
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(
      filter_html: true,
      hard_wrap: true)
      
    options = {
      # escape_html: true, # se to false to allow html, eg: <div>test</div>
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: false,
      autolink:           true,
      no_intra_emphasis: true,
      highlight: true,
      strikethrough: true,
      quote: true,
      no_images: false,
      superscript: true,
      footnotes: true,
      tables: true
    }

    markdown = Redcarpet::Markdown.new(coderayified, options)
    markdown.render(text).html_safe
  end
  
  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  # Returns the full title on a per-page basis.
  def base_title(page_title = '')
    base_title = "Sergio Mironescu"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def meta_description
    description = "I am a truly dynamic individual with next-level ideas and a killer resume to boot, considering myself a good front-ender with pretty good skills on Ruby (ruby on rails). I mainly focus on html(5), css(3) and javascript (jQuery, Angular, etc)."
  end

  def meta_keywords
    keywords = "html(5), css(3), sass, javascript, jquery, angular, bootstrap, ruby, ruby on rails, git, heroku"
  end
end
