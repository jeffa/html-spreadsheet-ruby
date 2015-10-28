require "test/unit"
require "Spreadsheet/HTML"

class Test_Indentation < Test::Unit::TestCase

  def test_indent

    data = Array[
        %w(header1 header2 header3),
        Array[ 'foo1', 'bar1', 'baz1' ],
        Array[ 'foo2', 'bar2', 'baz2' ],
    ]

    gen = Spreadsheet::HTML.new( 'data' => data, 'indent' => '  ' )

    assert_equal(
        "<table>\n  <tr>\n    <th>header1</th>\n    <th>header2</th>\n    <th>header3</th>\n  </tr>\n  <tr>\n    <td>foo1</td>\n    <td>bar1</td>\n    <td>baz1</td>\n  </tr>\n  <tr>\n    <td>foo2</td>\n    <td>bar2</td>\n    <td>baz2</td>\n  </tr>\n</table>\n",
        gen.generate(),
        "empty values are padded with default"
    )

  end

end
