# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'HTML/Spreadsheet/version'

Gem::Specification.new do |spec|
  spec.name          = "HTML-Spreadsheet"
  spec.version       = HTML::Spreadsheet::VERSION
  spec.authors       = ["jeffa"]
  spec.email         = ["jeffa@cpan.org"]
  spec.description   = %q{Just another HTML table generator}
  spec.summary       = %q{Generate HTML tables with ease (HTML4, XHTML and HTML5).}
  spec.homepage      = "https://github.com/jeffa/html-spreadsheet-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "HTML-AutoTag"
end
