require "test/unit"
require "Spreadsheet/HTML"

class Test_Padding < Test::Unit::TestCase

  def test_padding

    gen = Spreadsheet::HTML.new

    data = Array[
        %w(header1 header2 header3),
        Array[ 'foo1', 'bar1' ],
        Array[ 'foo2' ],
    ]

    assert_equal(
        '<table><tr><th>header1</th><th>header2</th><th>header3</th></tr><tr><td>foo1</td><td>bar1</td><td>&nbsp;</td></tr><tr><td>foo2</td><td>&nbsp;</td><td>&nbsp;</td></tr></table>',
        gen.generate( 'data' => data ),
        "empty values are padded with default"
    )

    data = Array[
        %w(header1 header2),
        Array[ 'foo1', 'bar1', 'baz1' ],
        Array[ 'foo2', 'bar2', 'baz2', 'qux2' ],
    ]

    assert_equal(
        '<table><tr><th>header1</th><th>header2</th></tr><tr><td>foo1</td><td>bar1</td></tr><tr><td>foo2</td><td>bar2</td></tr></table>',
        gen.generate( 'data' => data ),
        "extra values are truncated"
    )

  end

end
