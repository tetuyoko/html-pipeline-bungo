module HTML
  class Pipeline
    class ParagraphFilter < TextFilter

      def call
        paragraph_filter(@text)
      end

      private

      def paragraph_filter(text)
        "<p>#{text.gsub(/\r\n|\r|\n/, "</p><p>")}</p>"
      end

    end
  end
end
