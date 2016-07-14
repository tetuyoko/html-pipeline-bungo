module HTML
  class Pipeline

    class EmphFilter < TextFilter
      def call
        emph_dot_filter(@text)
      end

      private

      def emph_dot_filter(text)
        text.gsub(/:([^:\(\)\!]+?)\.\./) do |match|
          literals = $1.split(//).map{|lt| "<span class='boten'>#{lt}</span>"}
          "<span class='botenparent'>#{literals.join}</span>"
        end
      end

    end
  end
end
