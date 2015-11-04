require "test/unit"
require "Spreadsheet/HTML"

class Test_Encodes < Test::Unit::TestCase

  def test_encodes

    data = Array[
        %w(header1 header2 header3),
        Array[ '<foo1>', '&bar1', '"baz1' ],
        Array[ '<foo2>', '&bar2', '"baz2' ],
    ]

    gen = Spreadsheet::HTML.new( 'data' => data )

    assert_equal(
        '<table><tr><th>header1</th><th>header2</th><th>header3</th></tr><tr><td><foo1></td><td>&bar1</td><td>"baz1</td></tr><tr><td><foo2></td><td>&bar2</td><td>"baz2</td></tr></table>',
        gen.generate(),
        "nothing encoded by default"
    )

    assert_equal(
        '<table><tr><th>header1</th><th>header2</th><th>header3</th></tr><tr><td>&lt;foo1&gt;</td><td>&amp;bar1</td><td>&quot;baz1</td></tr><tr><td>&lt;foo2&gt;</td><td>&amp;bar2</td><td>&quot;baz2</td></tr></table>',
        gen.generate( 'encodes' => nil ),
        "default encoding works"
    )

    assert_equal(
        '<table><tr><th>header1</th><th>header2</th><th>header3</th></tr><tr><td><foo1></td><td>&amp;bar1</td><td>"baz1</td></tr><tr><td><foo2></td><td>&amp;bar2</td><td>"baz2</td></tr></table>',
        gen.generate( 'encodes' => '&' ),
        "only requested char is encoded"
    )

    assert_equal(
        '<table><tr><th>he&#97;der1</th><th>he&#97;der2</th><th>he&#97;der3</th></tr><tr><td><foo1></td><td>&amp;b&#97;r1</td><td>&quot;b&#97;z1</td></tr><tr><td><foo2></td><td>&amp;b&#97;r2</td><td>&quot;b&#97;z2</td></tr></table>',
        gen.generate( 'encodes' => 'a&"' ),
        "requested chars are encoded"
    )

  end

end
