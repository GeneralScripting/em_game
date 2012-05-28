module Haml
  module Filters

    # Parses the filtered text with [Markdown](http://daringfireball.net/projects/markdown).
    # Only works if [RDiscount](http://github.com/rtomayko/rdiscount),
    # [RPeg-Markdown](http://github.com/rtomayko/rpeg-markdown),
    # [Maruku](http://maruku.rubyforge.org),
    # [BlueCloth](www.deveiate.org/projects/BlueCloth),
    # or [Redcarpet](https://github.com/tanoku/redcarpet) are installed.
    module Markdown
      include Base
      lazy_require 'rdiscount', 'peg_markdown', 'maruku', 'bluecloth', 'redcarpet'

      # @see Base#render
      def render(text)
        engine = case @required
                 when 'rdiscount'
                   ::RDiscount
                 when 'peg_markdown'
                   ::PEGMarkdown
                 when 'maruku'
                   ::Maruku
                 when 'bluecloth'
                   ::BlueCloth
                 when 'redcarpet'
                   ::Redcarpet
                 end
        if engine == ::Redcarpet
          markdown = engine::Markdown.new(engine::Render::HTML, :hard_wrap => true, :autolink => true, :filter_html => true, :no_intra_emphasis => true)
          markdown.render(text)
        else
          engine.new(text).to_html
        end
      end
    end

    # Parses the filtered text with [Maruku](http://maruku.rubyforge.org),
    # which has some non-standard extensions to Markdown.
    module Maruku
      include Base
      lazy_require 'maruku'

      # @see Base#render
      def render(text)
        ::Maruku.new(text).to_html
      end
    end

    # Parses the filtered text with [Redcarpet](https://github.com/tanoku/redcarpet)
    module Redcarpet
      include Base
      lazy_require 'redcarpet'

      # @see Base#render
      def render(text)
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :hard_wrap => true, :autolink => true, :filter_html => true, :no_intra_emphasis => true, :fenced_code => true, :gh_blockcode => true, :space_after_headers => true)
        markdown.render(text)
        #::Redcarpet.new(text, [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]).to_html
      end
    end

  end
end