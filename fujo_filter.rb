require 'html/pipeline'

module HTML
  class Pipeline

    class EmphDotFilter < TextFilter
      def initialize(text, context = nil, result = nil)
        super text, context, result
        @text = @text.gsub "\r", ''
      end

      def call
        html = @text.gsub(/:([^:]+?)\.\./) do |match|
          "<em class='emphasis-dot'><span>#{$1}</span></em>"
        end
        
        html.rstrip!
        html
      end
    end

    class RubyFilter < TextFilter
      def initialize(text, context = nil, result = nil)
        super text, context, result
        @text = @text.gsub "\r", ''
      end

      def call
        html = @text.gsub(/:([^:]+?)\(([^:]+?)\)/) do |match|
          "<ruby><rb>#{$1}</rb><rp>(</rp><rt>#{$2}</rt><rp>)</rp></ruby>"
        end
        
        html.rstrip!
        html
      end
    end

  end
end

def main
  oreore_pipeline = HTML::Pipeline.new [
    HTML::Pipeline::PlainTextInputFilter,
    HTML::Pipeline::EmphDotFilter,
    HTML::Pipeline::RubyFilter,
  ]

  html_fragment = "<div>:鴨川(かもがわ)の水</div> :傍点.."
  result = oreore_pipeline.call(html_fragment)
  f = File.new "./hoge.html", "w"
  f.puts result[:output].to_s
  f.close
  p  result[:output].to_s
end

main
