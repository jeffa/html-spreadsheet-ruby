Spreadsheet-HTML (ruby)
=======================
Just another HTML table generator for ruby.

Description
-----------
Generate HTML tables with ease (HTML4, XHTML and HTML5).

Synopsis
--------
```ruby
require 'Spreadsheet/HTML'

data = Array[ [1,2,3], [4,5,6] ]
generator = Spreadsheet::HTML.new()
puts generator.generate( data )
puts generator.generate( 'data' => data )

generator = Spreadsheet::HTML.new( 'data' => data )
puts generator.portrait( 'indent' => "\t" )
puts generator.landscape( 'encodes' => 1 )

puts generator.generate( 'tgroups' => 1 )
puts generator.generate( 'tgroups' => 2 )

puts generator.generate( 'tr' => { 'class' => %w{ odd even } } )
```

Installation
------------
* gem install Spreadsheet-HTML

License and Copyright
---------------------
See [License](License.md).
