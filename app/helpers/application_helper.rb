module ApplicationHelper
  
  def indented_render(num, *args)
    render(*args).gsub("Add a Reply", "\t" * num).html_safe
  end

  def markdown(text)

    options = {
      # escape_html: true, # se to false to allow html, eg: <div>test</div>
      link_attributes: { rel: 'nofollow', target: "_blank" },
      hard_wrap: true,
      fenced_code_blocks: true,
      filter_html: true
    }
    
    extensions = {
      space_after_headers: true,
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

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
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
    @description = "I'm a truly dynamic individual with top-level ideas and a impressive resume to prove it, considering myself a good front-ender with pretty good skills on Ruby (Ruby on Rails). I mainly focus on HTML(5), CSS(3) and Javascript (jQuery, Angular, etc)."
  end

  def meta_keywords
    @keywords = "html(5), css(3), sass, javascript, jquery, angular, bootstrap, ruby, ruby on rails, git, heroku"
  end
end
