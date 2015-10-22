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
end
