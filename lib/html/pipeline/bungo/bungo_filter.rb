module HTML
  class Pipeline
    class BungoFilter < TextFilter
      def call
        html = @text
        html = ruby_fliter(html)
        html = emph_dot_fliter(html)
        html.rstrip!
        html
      end

      private

      def ruby_fliter(text)
        text.gsub(/:([^:]+?)\(([^:]+?)\)/) do |match|
          "<ruby><rb>#{$1}</rb><rp>(</rp><rt>#{$2}</rt><rp>)</rp></ruby>"
        end
      end

      def emph_dot_fliter(text)
        text.gsub(/:([^:]+?)\.\./) do |match|
          "<em class='emphasis-dot'><span>#{$1}</span></em>"
        end
      end

    end
  end
end
