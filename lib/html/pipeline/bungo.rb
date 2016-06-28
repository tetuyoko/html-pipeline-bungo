require "html/pipeline"
require "html/pipeline/bungo/version"
require "html/pipeline/bungo/bungo_filter.rb"
require "html/pipeline/bungo/nowrap_plain_text_input_filter.rb"

module Html
  module Pipeline
    autoload :BungoFilter, 'html/pipeline/bungo/bungo_filter'
    autoload :NowrapPlainTextFilter, 'html/pipeline/bungo/nowrap_plain_text_input_filter'
  end
end
