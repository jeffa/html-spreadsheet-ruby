require "test/unit"
require "Spreadsheet/HTML"

class Test_Tgroups < Test::Unit::TestCase

  def test_orientations

    data = Array[
        %w(header1 header2 header3 header4),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    gen = Spreadsheet::HTML.new( 'data' => data, 'tgroups' => 2 )

    assert_equal(
        '<table><thead><tr><th>header1</th><th>header2</th><th>header3</th><th>header4</th></tr></thead><tfoot><tr><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></tfoot><tbody><tr><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr></tbody></table>',
        gen.generate(),
        "tgroup tags present from generate()"
    )

    assert_equal(
        '<table><thead><tr><th>header1</th><th>header2</th><th>header3</th><th>header4</th></tr></thead><tfoot><tr><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></tfoot><tbody><tr><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr></tbody></table>',
        gen.north(),
        "tgroup tags present from north()"
    )

    assert_equal(
        '<table><tr><th>header1</th><td>foo1</td><td>foo2</td><td>foo3</td><td>foo4</td></tr><tr><th>header2</th><td>bar1</td><td>bar2</td><td>bar3</td><td>bar4</td></tr><tr><th>header3</th><td>baz1</td><td>baz2</td><td>baz3</td><td>baz4</td></tr><tr><th>header4</th><td>qux1</td><td>qux2</td><td>qux3</td><td>qux4</td></tr></table>',
        gen.landscape(),
        "tgroup tags never present from landscape()"
    )

    assert_equal(
        '<table><tr><th>header1</th><td>foo1</td><td>foo2</td><td>foo3</td><td>foo4</td></tr><tr><th>header2</th><td>bar1</td><td>bar2</td><td>bar3</td><td>bar4</td></tr><tr><th>header3</th><td>baz1</td><td>baz2</td><td>baz3</td><td>baz4</td></tr><tr><th>header4</th><td>qux1</td><td>qux2</td><td>qux3</td><td>qux4</td></tr></table>',
        gen.west(),
        "tgroup tags never present from west()"
    )

    assert_equal(
        '<table><tr><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr><tr><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr><tr><th>header1</th><th>header2</th><th>header3</th><th>header4</th></tr></table>',
        gen.south(),
        "tgroup tags never present from south()"
    )

    assert_equal(
        '<table><tr><td>foo1</td><td>foo2</td><td>foo3</td><td>foo4</td><th>header1</th></tr><tr><td>bar1</td><td>bar2</td><td>bar3</td><td>bar4</td><th>header2</th></tr><tr><td>baz1</td><td>baz2</td><td>baz3</td><td>baz4</td><th>header3</th></tr><tr><td>qux1</td><td>qux2</td><td>qux3</td><td>qux4</td><th>header4</th></tr></table>',
        gen.east(),
        "tgroup tags never present from east()"
    )

  end

  def test_ommisions

    data = Array[
        %w(header1 header2 header3 header4),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    gen = Spreadsheet::HTML.new( 'data' => data, 'tgroups' => 2 )

    assert_equal(
        '<table><thead><tr><th>header1</th><th>header2</th><th>header3</th><th>header4</th></tr></thead><tbody><tr><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr><tr><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></tbody></table>',
        gen.generate( 'tgroups' => 1 ),
        "tfoot ommited when tgroups is 1"
    )

    assert_equal(
        '<table><tbody><tr><td>header1</td><td>header2</td><td>header3</td><td>header4</td></tr><tr><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr><tr><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></tbody></table>',
        gen.generate( 'matrix' => 1, 'tgroups' => 1 ),
        "thead and tfoot ommited for matrix when tgroups is 1"
    )

    assert_equal(
        '<table><tbody><tr><td>header1</td><td>header2</td><td>header3</td><td>header4</td></tr><tr><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr><tr><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></tbody></table>',
        gen.generate( 'matrix' => 1, 'tgroups' => 2 ),
        "thead and tfoot ommited for matrix when tgroups is 2"
    )

  end

  def test_attrs

    data = Array[
        %w(header1 header2 header3 header4),
        %w(foo1 bar1 baz1 qux1),
        %w(foo2 bar2 baz2 qux2),
        %w(foo3 bar3 baz3 qux3),
        %w(foo4 bar4 baz4 qux4)
    ]

    gen = Spreadsheet::HTML.new( 'data' => data, 'tgroups' => 2 )

    assert_equal(
        '<table><tr class="odd"><th>header1</th><th>header2</th><th>header3</th><th>header4</th></tr><tr class="even"><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr class="odd"><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr class="even"><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr><tr class="odd"><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></table>',
        gen.generate( 'tgroups' => 0, 'tr' => { 'class' => %w{ odd even } } ),
        "styles applying to tr impact all rows when thead 0"
    )

    assert_equal(
        '<table><thead><tr><th>header1</th><th>header2</th><th>header3</th><th>header4</th></tr></thead><tbody><tr class="odd"><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr class="even"><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr class="odd"><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr><tr class="even"><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></tbody></table>',
        gen.generate( 'tgroups' => 1, 'tr' => { 'class' => %w{ odd even } } ),
        "styles applying to tr do not impact thead when thead 1"
    )

    assert_equal(
        '<table><thead><tr><th>header1</th><th>header2</th><th>header3</th><th>header4</th></tr></thead><tfoot><tr><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></tfoot><tbody><tr class="odd"><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr class="even"><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr class="odd"><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr></tbody></table>',
        gen.generate( 'tgroups' => 2, 'tr' => { 'class' => %w{ odd even } } ),
        "styles applying to tr do not impact thead and tfoot when thead 1"
    )

    assert_equal(
        '<table><thead><tr class="thead"><th>header1</th><th>header2</th><th>header3</th><th>header4</th></tr></thead><tbody><tr class="odd"><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr class="even"><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr class="odd"><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr><tr class="even"><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></tbody></table>',
        gen.generate( 'tgroups' => 1, 'tr' => { 'class' => %w{ odd even } }, 'thead.tr' => { 'class' => "thead" } ),
        "thead.tr impacts thead rows"
    )

    assert_equal(
        '<table><thead><tr><th>header1</th><th>header2</th><th>header3</th><th>header4</th></tr></thead><tfoot><tr class="tfoot"><td>foo4</td><td>bar4</td><td>baz4</td><td>qux4</td></tr></tfoot><tbody><tr class="odd"><td>foo1</td><td>bar1</td><td>baz1</td><td>qux1</td></tr><tr class="even"><td>foo2</td><td>bar2</td><td>baz2</td><td>qux2</td></tr><tr class="odd"><td>foo3</td><td>bar3</td><td>baz3</td><td>qux3</td></tr></tbody></table>',
        gen.generate( 'tgroups' => 2, 'tr' => { 'class' => %w{ odd even } }, 'tfoot.tr' => { 'class' => "tfoot" } ),
        "tfoot.tr impacts thead rows"
    )

  end

end
