module HTML
  class Pipeline

    class BoldFilter < TextFilter
      def call
        bold_filter(@text)
      end

      private

      def bold_filter(text)
        text.gsub(/:([^:]+?)\!/) do |match|
          "<b>#{$1}</b>"
        end
      end
    end

  end
end
