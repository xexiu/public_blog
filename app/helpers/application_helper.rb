module ApplicationHelper
  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true,
      highlight: true,
      strikethrough: true,
      quote: true,
      no_images: true,
      no_styles: true,
      prettify: true,
      superscript: true,
      footnotes: true,
      tables: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
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
