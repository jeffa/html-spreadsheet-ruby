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
puts generator.portrait()
puts generator.landscape()
```

Installation
------------
We are currently pre-Alpha, so installation is not recommended.

* gem install bundler
* gem install test-unit
* rake test
* rake build
* ~~rake install~~ :skull:

License and Copyright
---------------------
See [License](License.md).
