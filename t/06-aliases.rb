require "test/unit"
require "Spreadsheet/HTML"

class Test_Aliases < Test::Unit::TestCase

  def test_portrait

    data = Array[
        %w(header1 header2 header3 header4),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><th>header1</th><th>header2</th><th>header3</th><th>header4</th></tr><tr><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr><tr><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).portrait(),
        "via constructor and method"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.portrait( data ),
        "with array ref"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.portrait( 'data' => data ),
        "named args only"
    )

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'theta' => 90 ).portrait(),
        "theta disabled via constructor and method"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.portrait( data, 'theta' => 180 ),
        "theta disabled with array ref"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.portrait( 'data' => data, 'theta' => 270 ),
        "theta disabled named args only"
    )

    html = '<table><tr><td>header1</td><td>header2</td><td>header3</td><td>header4</td></tr><tr><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr><tr><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'matrix' => 1 ).portrait(),
        "matrix via constructor and method"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.portrait( data, 'matrix' => 1 ),
        "matrix with array ref"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.portrait( 'data' => data, 'matrix' => 1 ),
        "matrix named args only"
    )

    html = '<table><tr><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr><tr><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'headless' => 1 ).portrait(),
        "headless via constructor and method"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.portrait( data, 'headless' => 1 ),
        "headless with array ref"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.portrait( 'data' => data, 'headless' => 1 ),
        "headless named args only"
    )

  end

  def test_landscape

    data = Array[
        %w(header1 header2 header3 header4),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><th>header1</th><td>foo1</td><td>foo2</td><td>foo3</td><td>foo4</td></tr><tr><th>header2</th><td>bar1</td><td>bar2</td><td>bar3</td><td>bar4</td></tr><tr><th>header3</th><td>baz1</td><td>baz2</td><td>baz3</td><td>baz4</td></tr><tr><th>header4</th><td>qux1</td><td>qux2</td><td>qux3</td><td>qux4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).landscape(),
        "via constructor and method"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.landscape( data ),
        "with array ref"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.landscape( 'data' => data ),
        "named args only"
    )

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'theta' => 90 ).landscape(),
        "theta disabled via constructor and method"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.landscape( data, 'theta' => 180 ),
        "theta disabled with array ref"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.landscape( 'data' => data, 'theta' => 270 ),
        "theta disabled named args only"
    )

    html = '<table><tr><td>header1</td><td>foo1</td><td>foo2</td><td>foo3</td><td>foo4</td></tr><tr><td>header2</td><td>bar1</td><td>bar2</td><td>bar3</td><td>bar4</td></tr><tr><td>header3</td><td>baz1</td><td>baz2</td><td>baz3</td><td>baz4</td></tr><tr><td>header4</td><td>qux1</td><td>qux2</td><td>qux3</td><td>qux4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'matrix' => 1 ).landscape(),
        "matrix via constructor and method"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.landscape( data, 'matrix' => 1 ),
        "matrix with array ref"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.landscape( 'data' => data, 'matrix' => 1 ),
        "matrix named args only"
    )

    html = '<table><tr><td>foo1</td><td>foo2</td><td>foo3</td><td>foo4</td></tr><tr><td>bar1</td><td>bar2</td><td>bar3</td><td>bar4</td></tr><tr><td>baz1</td><td>baz2</td><td>baz3</td><td>baz4</td></tr><tr><td>qux1</td><td>qux2</td><td>qux3</td><td>qux4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'headless' => 1 ).landscape(),
        "headless via constructor and method"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.landscape( data, 'headless' => 1 ),
        "headless with array ref"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.landscape( 'data' => data, 'headless' => 1 ),
        "headless named args only"
    )

  end

  def test_aliases

    data = Array[
        %w(header1 header2 header3 header4),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    assert_equal(
        Spreadsheet::HTML.new( 'data' => data ).generate(),
        Spreadsheet::HTML.new( 'data' => data ).portrait(),
        "portrait is generate via constructor and method"
    )
    assert_equal(
        Spreadsheet::HTML.new.generate( data ),
        Spreadsheet::HTML.new.portrait( data ),
        "portrait is generate with array ref"
    )
    assert_equal(
        Spreadsheet::HTML.new.generate( 'data' => data ),
        Spreadsheet::HTML.new.portrait( 'data' => data ),
        "portrait is generate named args only"
    )

    assert_equal(
        Spreadsheet::HTML.new( 'data' => data ).generate(),
        Spreadsheet::HTML.new( 'data' => data ).north(),
        "north is generate via constructor and method"
    )
    assert_equal(
        Spreadsheet::HTML.new.generate( data ),
        Spreadsheet::HTML.new.north( data ),
        "north is generate with array ref"
    )
    assert_equal(
        Spreadsheet::HTML.new.generate( 'data' => data ),
        Spreadsheet::HTML.new.north( 'data' => data ),
        "north is generate named args only"
    )

    assert_equal(
        Spreadsheet::HTML.new( 'data' => data ).west(),
        Spreadsheet::HTML.new( 'data' => data ).landscape(),
        "west is landscape via constructor and method"
    )
    assert_equal(
        Spreadsheet::HTML.new.west( data ),
        Spreadsheet::HTML.new.landscape( data ),
        "west is landscape with array ref"
    )
    assert_equal(
        Spreadsheet::HTML.new.west( 'data' => data ),
        Spreadsheet::HTML.new.landscape( 'data' => data ),
        "west is landscape named args only"
    )

    assert_equal(
        Spreadsheet::HTML.new( 'data' => data ).west(),
        Spreadsheet::HTML.new( 'data' => data, 'theta' => -270 ).generate(),
        "west is theta -270 via constructor and method"
    )
    assert_equal(
        Spreadsheet::HTML.new.west( data ),
        Spreadsheet::HTML.new.generate( data, 'theta' => -270 ),
        "west is theta -270 with array ref"
    )
    assert_equal(
        Spreadsheet::HTML.new.west( 'data' => data ),
        Spreadsheet::HTML.new.generate( 'data' => data, 'theta' => -270 ),
        "west is theta -270 named args only"
    )

    assert_equal(
        Spreadsheet::HTML.new( 'data' => data ).east(),
        Spreadsheet::HTML.new( 'data' => data, 'theta' => 90 ).generate(),
        "east is theta 90 via constructor and method"
    )
    assert_equal(
        Spreadsheet::HTML.new.east( data ),
        Spreadsheet::HTML.new.generate( data, 'theta' => 90 ),
        "east is theta 90 with array ref"
    )
    assert_equal(
        Spreadsheet::HTML.new.east( 'data' => data ),
        Spreadsheet::HTML.new.generate( 'data' => data, 'theta' => 90 ),
        "east is theta 90 named args only"
    )

    assert_equal(
        Spreadsheet::HTML.new( 'data' => data ).south(),
        Spreadsheet::HTML.new( 'data' => data, 'theta' => -180 ).generate(),
        "south is theta -180 via constructor and method"
    )
    assert_equal(
        Spreadsheet::HTML.new.south( data ),
        Spreadsheet::HTML.new.generate( data, 'theta' => -180 ),
        "south is theta -180 with array ref"
    )
    assert_equal(
        Spreadsheet::HTML.new.south( 'data' => data ),
        Spreadsheet::HTML.new.generate( 'data' => data, 'theta' => -180 ),
        "south is theta -180 named args only"
    )

    end

end
