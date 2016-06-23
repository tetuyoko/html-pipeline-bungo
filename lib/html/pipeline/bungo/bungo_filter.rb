module HTML
  class Pipeline
    class BungoFilter < TextFilter
      def call
        html = @text
        html = ruby_fliter(html)
        html = emph_dot_fliter(html)
        html = bold_fliter(html)
        html.gsub!(/(\r\n|\r|\n)/, "\n\n")
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
          literals = $1.split(//).map{|lt| "<span class='boten'>#{lt}</span>"}
          "<span class='botenparent'>#{literals.join}</span>"
        end
      end

      def bold_fliter(text)
        text.gsub(/:([^:]+?)\!/) do |match|
          "<b>#{$1}</b>"
        end
      end
    end
  end
end
