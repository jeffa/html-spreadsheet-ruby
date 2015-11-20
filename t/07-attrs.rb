require "test/unit"
require "Spreadsheet/HTML"

class Test_Attributes < Test::Unit::TestCase

  def test_table

    data = Array[
        %w(header1 header2 header3 header4),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table class="spreadsheet"><tr><th>header1</th><th>header2</th><th>header3</th><th>header4</th></tr><tr><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr><tr><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'table' => { 'class' => 'spreadsheet' } ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, 'table' => { 'class' => 'spreadsheet' } ),
        "via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'table' => { 'class' => 'spreadsheet' } ),
        "via constructor and method"
    )

  end 

  def test_tr

    data = Array[
        %w(header1 header2 header3 header4),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr class="row"><th>header1</th><th>header2</th><th>header3</th><th>header4</th></tr><tr class="row"><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr class="row"><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr class="row"><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr><tr class="row"><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'tr' => { 'class' => 'row' } ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, 'tr' => { 'class' => 'row' } ),
        "via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'tr' => { 'class' => 'row' } ),
        "via constructor and method"
    )

  end 

  def test_tr_rotate

    data = Array[
        %w(header1 header2 header3 header4),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr class="odd"><th>header1</th><th>header2</th><th>header3</th><th>header4</th></tr><tr class="even"><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr class="odd"><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr class="even"><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr><tr class="odd"><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'tr' => { 'class' => %w{ odd even } } ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, 'tr' => { 'class' => %w{ odd even } } ),
        "via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'tr' => { 'class' => %w{ odd even } } ),
        "via constructor and method"
    )

  end 

  def test_th

    data = Array[
        %w(header1 header2 header3 header4),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><th class="heading">header1</th><th class="heading">header2</th><th class="heading">header3</th><th class="heading">header4</th></tr><tr><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr><tr><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'th' => { 'class' => 'heading' } ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, 'th' => { 'class' => 'heading' } ),
        "via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'th' => { 'class' => 'heading' } ),
        "via constructor and method"
    )

  end 

  def test_th_rotate

    data = Array[
        %w(header1 header2 header3 header4),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><th class="h1">header1</th><th class="h2">header2</th><th class="h3">header3</th><th class="h4">header4</th></tr><tr><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr><tr><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'th' => { 'class' => %w{ h1 h2 h3 h4 } } ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, 'th' => { 'class' => %w{ h1 h2 h3 h4 } } ),
        "via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'th' => { 'class' => %w{ h1 h2 h3 h4 } } ),
        "via constructor and method"
    )

  end 

  def test_th_lambda

    data = Array[
        %w(header1 header2 header3 header4),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><th>HEADER1</th><th>HEADER2</th><th>HEADER3</th><th>HEADER4</th></tr><tr><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr><tr><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'th' => lambda { |c| c.upcase } ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, 'th' => lambda { |c| c.upcase } ),
        "via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'th' => lambda { |c| c.upcase } ),
        "via constructor and method"
    )

  end 

  def test_th_proc

    data = Array[
        %w(header1 header2 header3 header4),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><th>HEADER1</th><th>HEADER2</th><th>HEADER3</th><th>HEADER4</th></tr><tr><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr><tr><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'th' => Proc.new { |c| c.upcase } ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, 'th' => Proc.new { |c| c.upcase } ),
        "via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'th' => Proc.new { |c| c.upcase } ),
        "via constructor and method"
    )

  end 

  def test_th_attr_and_lambda

    data = Array[
        %w(header1 header2 header3 header4),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><th style="color: red;">HEADER1</th><th style="color: green;">HEADER2</th><th style="color: blue;">HEADER3</th><th style="color: red;">HEADER4</th></tr><tr><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr><tr><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'th' => [ lambda { |c| c.upcase }, { 'style' => { 'color' => %w{ red green blue } } } ] ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, 'th' => [ lambda { |c| c.upcase }, { 'style' => { 'color' => %w{ red green blue } } } ] ),
        "via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'th' => [ lambda { |c| c.upcase }, { 'style' => { 'color' => %w{ red green blue } } } ] ),
        "via constructor and method"
    )

  end 

  def test_td

    data = Array[
        %w(header1 header2 header3 header4),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><th>header1</th><th>header2</th><th>header3</th><th>header4</th></tr><tr><td class="cell">foo1</td><td class="cell">bar1</td><td class="cell">baz1</td><td class="cell">qux1</td></tr><tr><td class="cell">foo2</td><td class="cell">bar2</td><td class="cell">baz2</td><td class="cell">qux2</td></tr><tr><td class="cell">foo3</td><td class="cell">bar3</td><td class="cell">baz3</td><td class="cell">qux3</td></tr><tr><td class="cell">foo4</td><td class="cell">bar4</td><td class="cell">baz4</td><td class="cell">qux4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'td' => { 'class' => 'cell' } ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, 'td' => { 'class' => 'cell' } ),
        "via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'td' => { 'class' => 'cell' } ),
        "via constructor and method"
    )

  end

  def test_td_rotate

    data = Array[
        %w(header1 header2 header3 header4),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><th>header1</th><th>header2</th><th>header3</th><th>header4</th></tr><tr><td style="color: red;">foo1</td><td style="color: green;">bar1</td><td style="color: blue;">baz1</td><td style="color: red;">qux1</td></tr><tr><td style="color: green;">foo2</td><td style="color: blue;">bar2</td><td style="color: red;">baz2</td><td style="color: green;">qux2</td></tr><tr><td style="color: blue;">foo3</td><td style="color: red;">bar3</td><td style="color: green;">baz3</td><td style="color: blue;">qux3</td></tr><tr><td style="color: red;">foo4</td><td style="color: green;">bar4</td><td style="color: blue;">baz4</td><td style="color: red;">qux4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'td' => { 'style' => { 'color' => %w{ red green blue } } } ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, 'td' => { 'style' => { 'color' => %w{ red green blue } } } ),
        "via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'td' => { 'style' => { 'color' => %w{ red green blue } } } ),
        "via constructor and method"
    )

  end

  def test_td_lambda

    data = Array[
        %w(header1 header2 header3 header4),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><th>header1</th><th>header2</th><th>header3</th><th>header4</th></tr><tr><td>FOO1</td><td>BAR1</td><td>BAZ1</td><td>QUX1</td></tr><tr><td>FOO2</td><td>BAR2</td><td>BAZ2</td><td>QUX2</td></tr><tr><td>FOO3</td><td>BAR3</td><td>BAZ3</td><td>QUX3</td></tr><tr><td>FOO4</td><td>BAR4</td><td>BAZ4</td><td>QUX4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'td' => lambda { |c| c.upcase } ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, 'td' => lambda { |c| c.upcase } ),
        "via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'td' => lambda { |c| c.upcase } ),
        "via constructor and method"
    )

  end 

  def test_td_attr_and_lambda

    data = Array[
        %w(header1 header2 header3 header4),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><th>header1</th><th>header2</th><th>header3</th><th>header4</th></tr><tr><td style="color: red;">FOO1</td><td style="color: green;">BAR1</td><td style="color: blue;">BAZ1</td><td style="color: red;">QUX1</td></tr><tr><td style="color: green;">FOO2</td><td style="color: blue;">BAR2</td><td style="color: red;">BAZ2</td><td style="color: green;">QUX2</td></tr><tr><td style="color: blue;">FOO3</td><td style="color: red;">BAR3</td><td style="color: green;">BAZ3</td><td style="color: blue;">QUX3</td></tr><tr><td style="color: red;">FOO4</td><td style="color: green;">BAR4</td><td style="color: blue;">BAZ4</td><td style="color: red;">QUX4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'td' => [ lambda { |c| c.upcase }, { 'style' => { 'color' => %w{ red green blue } } } ] ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, 'td' => [ lambda { |c| c.upcase }, { 'style' => { 'color' => %w{ red green blue } } } ] ),
        "via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'td' => [ lambda { |c| c.upcase }, { 'style' => { 'color' => %w{ red green blue } } } ] ),
        "via constructor and method"
    )

  end 

  def test_headings

    data = Array[
        %w(header1 header2 header3 header4),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    html = '<table><tr><th style="color: red;">header1</th><th style="color: green;">header2</th><th style="color: blue;">header3</th><th style="color: red;">header4</th></tr><tr><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr><tr><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'headings' => { 'style' => { 'color' => %w{ red green blue } } } ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, 'headings' => { 'style' => { 'color' => %w{ red green blue } } } ),
        "via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'headings' => { 'style' => { 'color' => %w{ red green blue } } } ),
        "via constructor and method"
    )

    html = '<table><tr><th>header1</th><th style="color: red;">header2</th><th>header3</th><th>header4</th></tr><tr><td>foo1</td><td style="color: green;">bar1</td><td>baz1</td><td>qux1</td></tr><tr><td>foo2</td><td style="color: blue;">bar2</td><td>baz2</td><td>qux2</td></tr><tr><td>foo3</td><td style="color: red;">bar3</td><td>baz3</td><td>qux3</td></tr><tr><td>foo4</td><td style="color: green;">bar4</td><td>baz4</td><td>qux4</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, '_header2' => { 'style' => { 'color' => %w{ red green blue } } } ).generate(),
        "via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, '_header2' => { 'style' => { 'color' => %w{ red green blue } } } ),
        "via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( '_header2' => { 'style' => { 'color' => %w{ red green blue } } } ),
        "via constructor and method"
    )

  end

  def test_cX_attr

    data = Array[
        %w(header1 header2 header3),
        %w(foo1 bar1 baz1),
        %w(foo2 bar2 baz2),
    ]

    html = '<table><tr><th>header1</th><th style="color: red;">header2</th><th>header3</th></tr><tr><td>foo1</td><td style="color: green;">bar1</td><td>baz1</td></tr><tr><td>foo2</td><td style="color: blue;">bar2</td><td>baz2</td></tr></table>';

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, '_c1' => { 'style' => { 'color' => %w{ red green blue } } } ).generate(),
        "_c1 attr via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, '_c1' => { 'style' => { 'color' => %w{ red green blue } } } ),
        "_c1 attr via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( '_c1' => { 'style' => { 'color' => %w{ red green blue } } } ),
        "_c1 attr via constructor and method"
    )

  end

  def test_cX_lambda

    data = Array[
        %w(header1 header2 header3),
        %w(foo1 bar1 baz1),
        %w(foo2 bar2 baz2),
    ]

    html = '<table><tr><th>header1</th><th>HEADER2</th><th>header3</th></tr><tr><td>foo1</td><td>BAR1</td><td>baz1</td></tr><tr><td>foo2</td><td>BAR2</td><td>baz2</td></tr></table>';

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, '_c1' => lambda { |c| c.upcase } ).generate(),
        "_c1 attr via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, '_c1' => lambda { |c| c.upcase } ),
        "_c1 attr via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( '_c1' => lambda { |c| c.upcase } ),
        "_c1 attr via constructor and method"
    )

  end

  def test_cX_attr_and_lambda

    data = Array[
        %w(header1 header2 header3),
        %w(foo1 bar1 baz1),
        %w(foo2 bar2 baz2),
    ]

    html = '<table><tr><th>header1</th><th style="color: red;">HEADER2</th><th>header3</th></tr><tr><td>foo1</td><td style="color: green;">BAR1</td><td>baz1</td></tr><tr><td>foo2</td><td style="color: blue;">BAR2</td><td>baz2</td></tr></table>';

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, '_c1' => [ { 'style' => { 'color' => %w{ red green blue } } }, lambda { |c| c.upcase } ] ).generate(),
        "_c1 attr via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, '_c1' => [ { 'style' => { 'color' => %w{ red green blue } } }, lambda { |c| c.upcase } ] ),
        "_c1 attr via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( '_c1' => [ { 'style' => { 'color' => %w{ red green blue } } }, lambda { |c| c.upcase } ] ),
        "_c1 attr via constructor and method"
    )

  end

  def test_rX_attr

    data = Array[
        %w(header1 header2 header3),
        %w(foo1 bar1 baz1),
        %w(foo2 bar2 baz2),
    ]

    html = '<table><tr><th>header1</th><th>header2</th><th>header3</th></tr><tr><td style="color: red;">foo1</td><td style="color: green;">bar1</td><td style="color: blue;">baz1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td></tr></table>';

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, '_r1' => { 'style' => { 'color' => %w{ red green blue } } } ).generate(),
        "_r1 via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, '_r1' => { 'style' => { 'color' => %w{ red green blue } } } ),
        "_r1 via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( '_r1' => { 'style' => { 'color' => %w{ red green blue } } } ),
        "_r1 via constructor and method"
    )

  end

  def test_rX_lambda

    data = Array[
        %w(header1 header2 header3),
        %w(foo1 bar1 baz1),
        %w(foo2 bar2 baz2),
    ]

    html = '<table><tr><th>header1</th><th>header2</th><th>header3</th></tr><tr><td>FOO1</td><td>BAR1</td><td>BAZ1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td></tr></table>';

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, '_r1' => lambda { |c| c.upcase } ).generate(),
        "_r1 attr via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, '_r1' => lambda { |c| c.upcase } ),
        "_r1 attr via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( '_r1' => lambda { |c| c.upcase } ),
        "_r1 attr via constructor and method"
    )

  end

  def test_rX_attr_and_lambda

    data = Array[
        %w(header1 header2 header3),
        %w(foo1 bar1 baz1),
        %w(foo2 bar2 baz2),
    ]

    html = '<table><tr><th>header1</th><th>header2</th><th>header3</th></tr><tr><td style="color: red;">FOO1</td><td style="color: green;">BAR1</td><td style="color: blue;">BAZ1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td></tr></table>';

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, '_r1' => [ { 'style' => { 'color' => %w{ red green blue } } }, lambda { |c| c.upcase } ] ).generate(),
        "_r1 attr via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, '_r1' => [ { 'style' => { 'color' => %w{ red green blue } } }, lambda { |c| c.upcase } ] ),
        "_r1 attr via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( '_r1' => [ { 'style' => { 'color' => %w{ red green blue } } }, lambda { |c| c.upcase } ] ),
        "_r1 attr via constructor and method"
    )

  end

  def test_rXcX_attr

    data = Array[
        %w(header1 header2 header3),
        %w(foo1 bar1 baz1),
        %w(foo2 bar2 baz2),
    ]

    html = '<table><tr><th>header1</th><th>header2</th><th>header3</th></tr><tr><td>foo1</td><td>bar1</td><td style="color: red;">baz1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td></tr></table>';

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, '_r1c2' => { 'style' => { 'color' => %w{ red green blue } } } ).generate(),
        "_r1c2 via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, '_r1c2' => { 'style' => { 'color' => %w{ red green blue } } } ),
        "_r1c2 via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( '_r1c2' => { 'style' => { 'color' => %w{ red green blue } } } ),
        "_r1c2 via constructor and method"
    )

  end

  def test_rXcX_lambda

    data = Array[
        %w(header1 header2 header3),
        %w(foo1 bar1 baz1),
        %w(foo2 bar2 baz2),
    ]

    html = '<table><tr><th>header1</th><th>header2</th><th>header3</th></tr><tr><td>foo1</td><td>bar1</td><td>BAZ1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td></tr></table>';

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, '_r1c2' => lambda { |c| c.upcase } ).generate(),
        "_r1c2 attr via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, '_r1c2' => lambda { |c| c.upcase } ),
        "_r1c2 attr via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( '_r1c2' => lambda { |c| c.upcase } ),
        "_r1c2 attr via constructor and method"
    )

  end

  def test_rXcX_attr_and_lambda

    data = Array[
        %w(header1 header2 header3),
        %w(foo1 bar1 baz1),
        %w(foo2 bar2 baz2),
    ]

    html = '<table><tr><th>header1</th><th>header2</th><th>header3</th></tr><tr><td>foo1</td><td>bar1</td><td class="foo">BAZ1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td></tr></table>';

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, '_r1c2' => [ { 'class' => 'foo' }, lambda { |c| c.upcase } ] ).generate(),
        "_r1c2 attr via constructor only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new().generate( 'data' => data, '_r1c2' => [ { 'class' => 'foo' }, lambda { |c| c.upcase } ] ),
        "_r1c2 attr via method only"
    )
    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( '_r1c2' => [ { 'class' => 'foo' }, lambda { |c| c.upcase } ] ),
        "_r1c2 attr via constructor and method"
    )

  end

end
