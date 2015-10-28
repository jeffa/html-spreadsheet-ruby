require "test/unit"
require "Spreadsheet/HTML"

class Test_Padding < Test::Unit::TestCase

  def test_empty

    data = Array[
        %w(header1 header2 header3),
        Array[ 'foo1', 'bar1', '' ],
        Array[ 'foo2', 'bar2', '' ],
    ]

    gen = Spreadsheet::HTML.new( 'data' => data )

    assert_equal(
        '<table><tr><th>header1</th><th>header2</th><th>header3</th></tr><tr><td>foo1</td><td>bar1</td><td>&nbsp;</td></tr><tr><td>foo2</td><td>bar2</td><td>&nbsp;</td></tr></table>',
        gen.generate(),
        "empty values are padded with default"
    )

  end

end
