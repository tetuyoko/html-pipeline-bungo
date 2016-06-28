# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'html/pipeline/bungo/version'

Gem::Specification.new do |spec|
  spec.name          = "html-pipeline-bungo"
  spec.version       = Html::Pipeline::Bungo::VERSION
  spec.authors       = ["tetuyoko"]
  spec.email         = ["tyokoyama53@gmail.com"]

  spec.summary       = %q{html/pipeline extension for writer.}
  spec.description   = %q{html/pipeline extension for writer.}
  spec.homepage      = "https://github.com/tetuyoko/html-pipeline-bungo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "html-pipeline", "~> 2.4.1"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "escape_utils", "~> 1.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
