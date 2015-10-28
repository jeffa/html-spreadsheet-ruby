require "test/unit"
require "Spreadsheet/HTML"

class Test_Empty < Test::Unit::TestCase

  def test_empty

    data = Array[
        %w(header1 header2 header3),
        Array[ 'foo1', '', 'baz1' ],
        Array[ '', 'bar2', '' ],
    ]

    gen = Spreadsheet::HTML.new( 'data' => data )
    assert_equal(
        '<table><tr><th>header1</th><th>header2</th><th>header3</th></tr><tr><td>foo1</td><td>&nbsp;</td><td>baz1</td></tr><tr><td>&nbsp;</td><td>bar2</td><td>&nbsp;</td></tr></table>',
        gen.generate(),
        "empty values are defaulted to &nbsp;"
    )

    assert_equal(
        '<table><tr><th>header1</th><th>header2</th><th>header3</th></tr><tr><td>foo1</td><td> </td><td>baz1</td></tr><tr><td> </td><td>bar2</td><td> </td></tr></table>',
        gen.generate( 'empty' => ' ' ),
        "empty values are overriden"
    )

  end

end
