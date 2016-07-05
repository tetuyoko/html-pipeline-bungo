require "html/pipeline"
require "html/pipeline/bungo/version"
require "html/pipeline/bungo/bold_filter.rb"
require "html/pipeline/bungo/dash_filter.rb"
require "html/pipeline/bungo/emph_filter.rb"
require "html/pipeline/bungo/paragraph_filter.rb"
require "html/pipeline/bungo/ruby_filter.rb"
require "html/pipeline/bungo/nowrap_plain_text_input_filter.rb"

module Html
  module Pipeline
    autoload :BoldFilter, 'html/pipeline/bungo/bold_filter'
    autoload :EmphFilter, 'html/pipeline/bungo/emph_filter'
    autoload :ParagraphFilter, 'html/pipeline/bungo/paragraph_filter'
    autoload :RubyFilter, 'html/pipeline/bungo/ruby_filter'
    autoload :NowrapPlainTextFilter, 'html/pipeline/bungo/nowrap_plain_text_input_filter'
  end
end
