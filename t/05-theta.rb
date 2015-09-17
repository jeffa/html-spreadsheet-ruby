require "test/unit"
require "Spreadsheet/HTML.rb"

class Test_Theta < Test::Unit::TestCase

  def test_0flip

    data = Array[
        %w(header1 header2 header3 header4 ),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><th>header4</th><th>header3</th><th>header2</th><th>header1</th></tr><tr><td>qux1</td><td>baz1</td><td>bar1</td><td>foo1</td></tr><tr><td>qux2</td><td>baz2</td><td>bar2</td><td>foo2</td></tr><tr><td>qux3</td><td>baz3</td><td>bar3</td><td>foo3</td></tr><tr><td>qux4</td><td>baz4</td><td>bar4</td><td>foo4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'flip' => 1 ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'flip' => 1 ),
        "via constructor and method"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.generate( data, 'flip' => 1 ),
        "with array ref"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.generate( 'data' => data, 'flip' => 1 ),
        "named args only"
    )

  end

  def test_90

    data = Array[
        %w(header1 header2 header3 header4 ),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><td>foo4</td><td>foo3</td><td>foo2</td><td>foo1</td><th>header1</th></tr><tr><td>bar4</td><td>bar3</td><td>bar2</td><td>bar1</td><th>header2</th></tr><tr><td>baz4</td><td>baz3</td><td>baz2</td><td>baz1</td><th>header3</th></tr><tr><td>qux4</td><td>qux3</td><td>qux2</td><td>qux1</td><th>header4</th></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'theta' => 90 ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'theta' => 90 ),
        "via constructor and method"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.generate( data, 'theta' => 90 ),
        "with array ref"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.generate( 'data' => data, 'theta' => 90 ),
        "named args only"
    )

  end

  def test_90_pinhead

    data = Array[
        %w(header1 header2 header3 header4 ),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><td>foo1</td><td>foo2</td><td>foo3</td><td>foo4</td><th>header1</th></tr><tr><td>bar1</td><td>bar2</td><td>bar3</td><td>bar4</td><th>header2</th></tr><tr><td>baz1</td><td>baz2</td><td>baz3</td><td>baz4</td><th>header3</th></tr><tr><td>qux1</td><td>qux2</td><td>qux3</td><td>qux4</td><th>header4</th></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'theta' => 90, 'pinhead' => 1 ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'theta' => 90, 'pinhead' => 1 ),
        "via constructor and method"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.generate( data, 'theta' => 90, 'pinhead' => 1 ),
        "with array ref"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.generate( 'data' => data, 'theta' => 90, 'pinhead' => 1 ),
        "named args only"
    )

  end

  def test_neg90

    data = Array[
        %w(header1 header2 header3 header4 ),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><td>qux4</td><td>qux3</td><td>qux2</td><td>qux1</td><th>header4</th></tr><tr><td>baz4</td><td>baz3</td><td>baz2</td><td>baz1</td><th>header3</th></tr><tr><td>bar4</td><td>bar3</td><td>bar2</td><td>bar1</td><th>header2</th></tr><tr><td>foo4</td><td>foo3</td><td>foo2</td><td>foo1</td><th>header1</th></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'theta' => -90 ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'theta' => -90 ),
        "via constructor and method"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.generate( data, 'theta' => -90 ),
        "with array ref"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.generate( 'data' => data, 'theta' => -90 ),
        "named args only"
    )

  end

  def test_neg90_pinhead

    data = Array[
        %w(header1 header2 header3 header4 ),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><td>qux1</td><td>qux2</td><td>qux3</td><td>qux4</td><th>header4</th></tr><tr><td>baz1</td><td>baz2</td><td>baz3</td><td>baz4</td><th>header3</th></tr><tr><td>bar1</td><td>bar2</td><td>bar3</td><td>bar4</td><th>header2</th></tr><tr><td>foo1</td><td>foo2</td><td>foo3</td><td>foo4</td><th>header1</th></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'theta' => -90, 'pinhead' => 1 ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'theta' => -90, 'pinhead' => 1 ),
        "via constructor and method"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.generate( data, 'theta' => -90, 'pinhead' => 1 ),
        "with array ref"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.generate( 'data' => data, 'theta' => -90, 'pinhead' => 1 ),
        "named args only"
    )

  end

  def test_180

    data = Array[
        %w(header1 header2 header3 header4 ),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><td>qux4</td><td>baz4</td><td>bar4</td><td>foo4</td></tr><tr><td>qux3</td><td>baz3</td><td>bar3</td><td>foo3</td></tr><tr><td>qux2</td><td>baz2</td><td>bar2</td><td>foo2</td></tr><tr><td>qux1</td><td>baz1</td><td>bar1</td><td>foo1</td></tr><tr><th>header4</th><th>header3</th><th>header2</th><th>header1</th></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'theta' => 180 ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'theta' => 180 ),
        "via constructor and method"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.generate( data, 'theta' => 180 ),
        "with array ref"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.generate( 'data' => data, 'theta' => 180 ),
        "named args only"
    )

  end

  def test_neg180

    data = Array[
        %w(header1 header2 header3 header4 ),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr><tr><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr><th>header1</th><th>header2</th><th>header3</th><th>header4</th></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'theta' => -180 ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'theta' => -180 ),
        "via constructor and method"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.generate( data, 'theta' => -180 ),
        "with array ref"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.generate( 'data' => data, 'theta' => -180 ),
        "named args only"
    )

  end

  def test_270

    data = Array[
        %w(header1 header2 header3 header4 ),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><th>header4</th><td>qux1</td><td>qux2</td><td>qux3</td><td>qux4</td></tr><tr><th>header3</th><td>baz1</td><td>baz2</td><td>baz3</td><td>baz4</td></tr><tr><th>header2</th><td>bar1</td><td>bar2</td><td>bar3</td><td>bar4</td></tr><tr><th>header1</th><td>foo1</td><td>foo2</td><td>foo3</td><td>foo4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'theta' => 270 ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'theta' => 270 ),
        "via constructor and method"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.generate( data, 'theta' => 270 ),
        "with array ref"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.generate( 'data' => data, 'theta' => 270 ),
        "named args only"
    )

  end

  def test_neg270

    data = Array[
        %w(header1 header2 header3 header4 ),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><th>header1</th><td>foo1</td><td>foo2</td><td>foo3</td><td>foo4</td></tr><tr><th>header2</th><td>bar1</td><td>bar2</td><td>bar3</td><td>bar4</td></tr><tr><th>header3</th><td>baz1</td><td>baz2</td><td>baz3</td><td>baz4</td></tr><tr><th>header4</th><td>qux1</td><td>qux2</td><td>qux3</td><td>qux4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'theta' => -270 ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'theta' => -270 ),
        "via constructor and method"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.generate( data, 'theta' => -270 ),
        "with array ref"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new.generate( 'data' => data, 'theta' => -270 ),
        "named args only"
    )

  end

end
