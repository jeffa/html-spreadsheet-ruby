Spreadsheet-HTML (ruby)
=======================
Just another HTML table generator for ruby. [![Gem Version](https://badge.fury.io/rb/Spreadsheet-HTML.svg)](https://rubygems.org/gems/Spreadsheet-HTML) [![Build Status](https://api.travis-ci.org/jeffa/spreadsheet-html-ruby.svg?branch=master)](https://travis-ci.org/jeffa/spreadsheet-html-ruby)

Description
-----------
Generate HTML tables with ease (HTML4, XHTML and HTML5).

Synopsis
--------
```ruby
require 'Spreadsheet/HTML'

data = Array[ [1,2,3], [4,5,6], [7,8,9] ]
generator = Spreadsheet::HTML.new()
puts generator.generate( data )
puts generator.generate( 'data' => data )

generator = Spreadsheet::HTML.new( 'data' => data, 'indent' => "\t" )
puts generator.portrait( 'encodes' => 1 )
puts generator.landscape( 'encode' => 1 )

puts generator.generate( 'tgroups' => 1 )
puts generator.generate( 'tgroups' => 2, 'indent' => 'nil' )

puts generator.generate( 'tr' => { 'class' => %w{ odd even } } )
```

Installation
------------
* gem install Spreadsheet-HTML

Documentation
-------------
[http://www.rubydoc.info/gems/Spreadsheet-HTML/]

License and Copyright
---------------------
See [License](License.md).
