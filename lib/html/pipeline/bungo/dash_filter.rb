module HTML
  class Pipeline

    class DashFilter < TextFilter
      def call
        dash_filter(@text)
      end

      private

      def dash_filter(text)
        text.gsub(':--', "<span class='dash'>――</span>")
      end
    end

  end
end
