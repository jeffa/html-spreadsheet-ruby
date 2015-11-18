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

  def test_fill

    gen = Spreadsheet::HTML.new

    data = Array[
        %w(header1 header2),
        Array[ 'foo1', 'bar1' ],
        Array[ 'foo2', 'bar2' ],
    ]

    assert_equal(
        '<table><tr><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></table>',
        gen.generate( 'fill' => '3x5' ),
        "fill works with no data"
    )

    assert_equal(
        '<table><tr><th>header1</th><th>header2</th></tr><tr><td>foo1</td><td>bar1</td></tr><tr><td>foo2</td><td>bar2</td></tr></table>',
        gen.generate( 'fill' => '1x2', 'data' => data ),
        "fill does not truncate larger data"
    )

    assert_equal(
        '<table><tr><th>&nbsp;</th></tr></table>',
        gen.generate( 'fill' => nil ),
        "fill defaults to 1x1 with with invalid data (nil)"
    )

    assert_equal(
        '<table><tr><th>&nbsp;</th></tr></table>',
        gen.generate( 'fill' => '' ),
        "fill defaults to 1x1 with with invalid data (empty)"
    )

    assert_equal(
        '<table><tr><th>&nbsp;</th></tr></table>',
        gen.generate( 'fill' => '0x0' ),
        "fill defaults to 1x1 with with invalid data (zero)"
    )

    assert_equal(
        '<table><tr><th>&nbsp;</th></tr></table>',
        gen.generate( 'fill' => '-2x4' ),
        "fill defaults to 1x1 with with invalid data (first negative)"
    )

    assert_equal(
        '<table><tr><th>&nbsp;</th></tr></table>',
        gen.generate( 'fill' => '1x-3' ),
        "fill defaults to 1x1 with with invalid data (second negative)"
    )

    assert_equal(
        '<table><tr><th>&nbsp;</th></tr></table>',
        gen.generate( 'fill' => 'axb' ),
        "fill defaults to 1x1 with with invalid data (letters)"
    )

    assert_equal(
        '<table><tr><th>header1</th><th>header2</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th></tr><tr><td>foo1</td><td>bar1</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>foo2</td><td>bar2</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></table>',
        gen.generate( 'fill' => '3x5', 'data' => data ),
        "fill works with valid data"
    )



  end

end
