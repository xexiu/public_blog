# need to be required to use Rouge with Redcarpet
require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

class MarkdownService
  class HTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet # yep, that's it.
    def rouge_formatter(opts={})
        opts ={line_numbers: true}
        Rouge::Formatters::HTML.new(opts)
    end
  end

  def initialize
    # ::Rouge::Formatters::HTML.new(opts.merge({ line_numbers: true }))
    options = { # DON'T TOUCH THIS OPTIONS UNLESS YOU KNOW WHAT YOUR DOING!!!
      # escape_html: true, # se to false to allow html, eg: <div>test</div>
      link_attributes: { rel: 'nofollow', target: "_blank" },
      hard_wrap: true,
      line_numbers: true,
      start_line: 1,
      filter_html: true
    }
    
    renderer = HTML.new(options)
    
    extensions = {
      fenced_code_blocks: true,
      space_after_headers: true,
      autolink:           true,
      no_intra_emphasis: true,
      highlight: true,
      strikethrough: true,
      quote: true,
      no_images: false,
      superscript: true,
      footnotes: true,
      tables: true,
      with_toc_data: true,
      lax_spacing: true
    }
    #renderer = Redcarpet::Render::HTML.new(options)
    @markdown = Redcarpet::Markdown.new(renderer, extensions)
  end
  
  def render(text)
    @markdown.render(text)
  end
end