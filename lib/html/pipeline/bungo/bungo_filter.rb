module HTML
  class Pipeline
    class BungoFilter < TextFilter
      def call
        html = @text
        html = ruby_filter(html)
        html = emph_dot_filter(html)
        html = bold_filter(html)
        html = paragraph_filter(html)
        html.rstrip!
        html
      end

      private

      def ruby_filter(text)
        text.gsub(/:([^:]+?)\(([^:]+?)\)/) do |match|
          "<ruby><rb>#{$1}</rb><rp>(</rp><rt>#{$2}</rt><rp>)</rp></ruby>"
        end
      end

      def emph_dot_filter(text)
        text.gsub(/:([^:]+?)\.\./) do |match|
          literals = $1.split(//).map{|lt| "<span class='boten'>#{lt}</span>"}
          "<span class='botenparent'>#{literals.join}</span>"
        end
      end

      def bold_filter(text)
        text.gsub(/:([^:]+?)\!/) do |match|
          "<b>#{$1}</b>"
        end
      end

      def paragraph_filter(text)
        "<p>#{text.gsub(/\r\n|\r|\n/, "</p><p>")}</p>"
      end

    end
  end
end
