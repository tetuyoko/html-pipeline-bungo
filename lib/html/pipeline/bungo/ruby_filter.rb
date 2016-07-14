module HTML
  class Pipeline
    class RubyFilter < TextFilter

      def call
        ruby_filter(@text)
      end

      private

      def ruby_filter(text)
        text.gsub(/:([^:\!\.]+?)\(([^:]+?)\)/) do |match|
          "<ruby><rb>#{$1}</rb><rp>(</rp><rt>#{$2}</rt><rp>)</rp></ruby>"
        end
      end

    end
  end
end
