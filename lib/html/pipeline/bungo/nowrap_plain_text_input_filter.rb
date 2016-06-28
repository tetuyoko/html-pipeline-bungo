begin
  require "escape_utils"
rescue LoadError => _
  raise HTML::Pipeline::MissingDependencyError, "Missing dependency 'escape_utils' for PlainTextInputFilter. See README.md for details."
end

module HTML
  class Pipeline
    class NowrapPlainTextInputFilter < TextFilter
      def call
        EscapeUtils.escape_html(@text, false)
      end
    end
  end
end
